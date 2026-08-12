import 'package:flutter/material.dart';

class ScannerOverlay extends StatefulWidget {
  final double width;
  final double height;
  
  const ScannerOverlay({super.key, required this.width, required this.height});

  @override
  State<ScannerOverlay> createState() => _ScannerOverlayState();
}

class _ScannerOverlayState extends State<ScannerOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanArea = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: widget.width,
      height: widget.height,
    );

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
        // Darkened background with transparent cutout
        CustomPaint(
          painter: _OverlayCutoutPainter(scanArea: scanArea, borderRadius: 16),
        ),
        
        // Glowing Corners
        Positioned.fromRect(
          rect: scanArea,
          child: CustomPaint(
            painter: _ScannerBorderPainter(color: Colors.greenAccent),
          ),
        ),
        
        // Animated Scanning Line
        Positioned.fromRect(
          rect: scanArea,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final position = _animationController.value * scanArea.height;
              return Stack(
                children: [
                  Positioned(
                    top: position,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent.withValues(alpha: 0.8),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}

class _OverlayCutoutPainter extends CustomPainter {
  final Rect scanArea;
  final double borderRadius;

  _OverlayCutoutPainter({required this.scanArea, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.6);
    
    final backgroundPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final cutoutPath = Path()..addRRect(RRect.fromRectAndRadius(scanArea, Radius.circular(borderRadius)));
    
    final combinedPath = Path.combine(PathOperation.difference, backgroundPath, cutoutPath);
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScannerBorderPainter extends CustomPainter {
  final Color color;

  _ScannerBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double lineLength = 30;
    
    // Top-Left
    canvas.drawLine(const Offset(0, 16), const Offset(0, lineLength), paint);
    canvas.drawLine(const Offset(16, 0), const Offset(lineLength, 0), paint);
    canvas.drawArc(const Rect.fromLTWH(0, 0, 32, 32), 3.14, 1.57, false, paint);

    // Top-Right
    canvas.drawLine(Offset(size.width, 16), Offset(size.width, lineLength), paint);
    canvas.drawLine(Offset(size.width - 16, 0), Offset(size.width - lineLength, 0), paint);
    canvas.drawArc(Rect.fromLTWH(size.width - 32, 0, 32, 32), -1.57, 1.57, false, paint);

    // Bottom-Left
    canvas.drawLine(Offset(0, size.height - 16), Offset(0, size.height - lineLength), paint);
    canvas.drawLine(Offset(16, size.height), Offset(lineLength, size.height), paint);
    canvas.drawArc(Rect.fromLTWH(0, size.height - 32, 32, 32), 1.57, 1.57, false, paint);

    // Bottom-Right
    canvas.drawLine(Offset(size.width, size.height - 16), Offset(size.width, size.height - lineLength), paint);
    canvas.drawLine(Offset(size.width - 16, size.height), Offset(size.width - lineLength, size.height), paint);
    canvas.drawArc(Rect.fromLTWH(size.width - 32, size.height - 32, 32, 32), 0, 1.57, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
