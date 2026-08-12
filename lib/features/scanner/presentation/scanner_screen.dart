import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/guest_scan_service.dart';
import 'barcode_scanner_screen.dart';
import 'ocr_scanner_screen.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  bool _isChecking = false;

  Future<void> _handleScanAction(VoidCallback onProceed) async {
    if (_isChecking) return;
    setState(() => _isChecking = true);
    try {
      final canScan = await ref.read(guestScanServiceProvider).canScan();
      if (mounted) {
        if (canScan) {
          onProceed();
        } else {
          _showAuthWallPopup();
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isChecking = false);
      }
    }
  }

  void _showAuthWallPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Free Scans Exhausted', style: TextStyle(color: AppColors.haram, fontWeight: FontWeight.bold)),
        content: const Text('You have completed your free guest scans! Please create a free account to continue scanning and unlock personalized features.'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              GoRouter.of(context).go('/auth');
            },
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('HalalBite Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Verify Products instantly',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Choose an analysis method below to determine if a product is Halal, Haram, or Doubtful.',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              
              // Barcode Scanner Button
              _buildScanCard(
                context: context,
                title: 'Scan Barcode',
                subtitle: 'Instantly check international product databases.',
                icon: Icons.qr_code_scanner_rounded,
                color: AppColors.primary,
                onTap: () => _handleScanAction(() {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()));
                }),
              ),
              
              const SizedBox(height: 24),
              
              // OCR Scanner Button
              _buildScanCard(
                context: context,
                title: 'Scan Ingredients',
                subtitle: 'Take a photo of the label for AI ingredient analysis.',
                icon: Icons.document_scanner_rounded,
                color: Colors.blueAccent,
                onTap: () => _handleScanAction(() {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OcrScannerScreen()));
                }),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScanCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
