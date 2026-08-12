import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:light/light.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/guest_scan_service.dart';
import '../../classification/domain/classification_engine.dart';
import '../../classification/presentation/result_bottom_sheet.dart';
import '../../history/data/history_repository.dart';
import '../../../core/services/analytics_service.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import 'scanner_overlay.dart';
import 'barcode_scanner_screen.dart';

class OcrScannerScreen extends ConsumerStatefulWidget {
  const OcrScannerScreen({super.key});

  @override
  ConsumerState<OcrScannerScreen> createState() => _OcrScannerScreenState();
}

class _OcrScannerScreenState extends ConsumerState<OcrScannerScreen> {
  CameraController? _cameraController;
  bool _isProcessing = false;
  bool _isFlashOn = false;
  final TextRecognizer _textRecognizer = TextRecognizer();
  bool _showLowLightWarning = false;
  late Light _light;
  StreamSubscription? _lightSubscription;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initLightSensor();
  }

  void _initLightSensor() {
    _light = Light();
    try {
      _lightSubscription = _light.lightSensorStream.listen((int luxValue) {
        if (!mounted) return;
        if (luxValue < 10 && !_showLowLightWarning && !_isFlashOn) {
          setState(() => _showLowLightWarning = true);
        } else if (luxValue >= 10 && _showLowLightWarning) {
          setState(() => _showLowLightWarning = false);
        }
      });
    } catch (_) {}
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    try {
      if (_isFlashOn) {
        await _cameraController!.setFlashMode(FlashMode.off);
        setState(() => _isFlashOn = false);
      } else {
        await _cameraController!.setFlashMode(FlashMode.torch);
        setState(() {
          _isFlashOn = true;
          _showLowLightWarning = false;
        });
      }
    } catch (e) {
      debugPrint('Error toggling flash: $e');
    }
  }

  @override
  void dispose() {
    _lightSubscription?.cancel();
    _cameraController?.setFlashMode(FlashMode.off);
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    
    setState(() => _isProcessing = true);
    await _processImageFile(image);
  }

  Future<void> _processImageFile(XFile image) async {
    try {
      final inputImage = InputImage.fromFilePath(image.path);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      final tokens = recognizedText.text
          .split(RegExp(r'[\s,]+'))
          .where((s) => s.trim().isNotEmpty)
          .toList();

      if (tokens.isEmpty) {
        if (mounted) {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.warning_amber_rounded, size: 48, color: Colors.orange),
                  const SizedBox(height: 16),
                  Text(AppLocalizations.of(context).noTextDetected, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context).noTextDetectedBody,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(AppLocalizations.of(context).tryAgain),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        setState(() => _isProcessing = false);
        return;
      }

      final engine = ref.read(classificationEngineProvider);
      final result = await engine.evaluateProduct(tokens);
      
      final String dummyProductName = tokens.isNotEmpty ? tokens.first.toUpperCase() : "Scanned Product";
      
      await ref.read(historyRepositoryProvider).saveScan(result, productName: dummyProductName);
      await ref.read(guestScanServiceProvider).incrementScanCount();
      await ref.read(analyticsServiceProvider).logScanCompleted(result: result.overallStatus.name, source: 'ocr');
      
      HapticFeedback.mediumImpact();

      if (mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => ResultBottomSheet(
            result: result,
            imagePath: image.path,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${AppLocalizations.of(context).error}: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<void> _scanImage() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized || _isProcessing) {
      return;
    }

    HapticFeedback.lightImpact();
    setState(() => _isProcessing = true);
    
    try {
      final XFile image = await _cameraController!.takePicture();
      await _processImageFile(image);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${AppLocalizations.of(context).error}: $e')),
        );
      }
      setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_cameraController != null && _cameraController!.value.isInitialized)
            CameraPreview(_cameraController!)
          else
            const Center(child: CircularProgressIndicator(color: AppColors.primary)),

          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 20, right: 20, bottom: 16,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withValues(alpha: 0.6), Colors.transparent],
                ),
              ),
              child: Row(
                children: [
                  const BackButton(color: Colors.white),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).scanIngredients,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_library_rounded, color: Colors.white),
                    onPressed: _pickImage,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                          color: Colors.white,
                        ),
                        onPressed: _toggleFlash,
                      ),
                      if (_showLowLightWarning && !_isFlashOn)
                        Positioned(
                          right: 0,
                          top: 48,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Low Light! Tap here 👆',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const ScannerOverlay(width: 280, height: 180),

          Positioned(
            bottom: 200, left: 0, right: 0,
            child: Center(
              child: _isProcessing 
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                        const SizedBox(width: 12),
                        Text(AppLocalizations.of(context).analyzing, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(24)),
                    child: Text(AppLocalizations.of(context).pointAtIngredientLabel, style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontWeight: FontWeight.w500)),
                  ),
            ),
          ),

          Positioned(
            bottom: 110, left: 0, right: 0,
            child: Center(
              child: IgnorePointer(
                ignoring: _isProcessing,
                child: GestureDetector(
                  onTap: _scanImage,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: _isProcessing ? 60 : 72,
                    height: _isProcessing ? 60 : 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isProcessing ? Colors.grey.shade300 : Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _isProcessing ? Colors.grey : AppColors.primary, width: 3),
                      ),
                      child: Icon(Icons.document_scanner_rounded, size: _isProcessing ? 24 : 28, color: _isProcessing ? Colors.grey : AppColors.primary),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Switcher
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSwitcherTab('Barcode', false, () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const BarcodeScannerScreen(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    }),
                    _buildSwitcherTab('Ingredients', true, () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitcherTab(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
