import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:light/light.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/guest_scan_service.dart';
import '../../classification/data/open_food_facts_service.dart';
import '../../classification/domain/classification_engine.dart';
import '../../classification/presentation/result_bottom_sheet.dart';
import '../../history/data/history_repository.dart';
import '../../../core/services/analytics_service.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import 'scanner_overlay.dart';
import 'ocr_scanner_screen.dart';

class BarcodeScannerScreen extends ConsumerStatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  ConsumerState<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends ConsumerState<BarcodeScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool _isProcessing = false;
  bool _isFlashOn = false;
  bool _showLowLightWarning = false;
  late Light _light;
  StreamSubscription? _lightSubscription;

  @override
  void initState() {
    super.initState();
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

  void _toggleFlash() {
    _controller.toggleTorch();
    setState(() {
      _isFlashOn = !_isFlashOn;
      if (_isFlashOn) _showLowLightWarning = false;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    
    setState(() => _isProcessing = true);
    try {
      final capture = await _controller.analyzeImage(image.path);
      if (capture != null) {
        await _handleBarcode(capture);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).productNotFound)),
          );
        }
      }
    } catch(e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${AppLocalizations.of(context).error}: $e')));
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<void> _handleBarcode(BarcodeCapture capture) async {
    if (_isProcessing) return;
    
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;
    
    final barcodeValue = barcodes.first.rawValue;
    if (barcodeValue == null) return;

    setState(() => _isProcessing = true);
    HapticFeedback.lightImpact();

    try {
      final product = await OpenFoodFactsService.getProductByBarcode(barcodeValue);
      
      if (product != null) {
        HapticFeedback.mediumImpact();
        
        // Pass ingredients to Classification Engine
        final engine = ref.read(classificationEngineProvider);
        final result = await engine.evaluateProduct(product.ingredients, isFromBarcode: true);
        
        await ref.read(historyRepositoryProvider).saveScan(result, productName: product.name);
        await ref.read(guestScanServiceProvider).incrementScanCount();
        await ref.read(analyticsServiceProvider).logScanCompleted(result: result.overallStatus.name, source: 'barcode');
        
        if (mounted) {
          Navigator.pop(context); // Close scanner screen
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => ResultBottomSheet(
              result: result,
              productName: product.name,
            ),
          );
        }
      } else {
        if (mounted) {
          // Product not found, fallback to OCR
          _showNotFoundDialog();
        }
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

  void _showNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).productNotFound),
        content: Text(AppLocalizations.of(context).productNotFoundBody),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to Home
              // Ideally navigate to OCR Scanner here
            },
            child: Text(AppLocalizations.of(context).ok),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _lightSubscription?.cancel();
    _controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _handleBarcode,
          ),
          
          const ScannerOverlay(width: 280, height: 180),

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
                  Semantics(
                    label: 'Go back to previous screen',
                    button: true,
                    child: const BackButton(color: Colors.white),
                  ),
                  Semantics(
                    header: true,
                    label: 'Scan Barcode Screen',
                    child: Text(
                      AppLocalizations.of(context).scanBarcode,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
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
                    _buildSwitcherTab('Barcode', true, () {}),
                    _buildSwitcherTab('Ingredients', false, () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const OcrScannerScreen(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          if (_isProcessing)
            Container(
              color: Colors.black.withValues(alpha: 0.6),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(color: AppColors.primary),
                    const SizedBox(height: 16),
                    Text(AppLocalizations.of(context).searchingProduct, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
