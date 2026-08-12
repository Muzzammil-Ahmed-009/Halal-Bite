import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _glassSlide;
  late Animation<double> _glassFade;
  late Animation<double> _halalWidth;
  late Animation<double> _biteWidth;
  late Animation<double> _emojiScale;
  late Animation<double> _emojiFade;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _glassSlide = Tween<Offset>(begin: const Offset(-0.3, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.0, 0.3, curve: Curves.easeOutCubic)),
    );
    _glassFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.0, 0.3, curve: Curves.easeIn)),
    );

    _halalWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.3, 0.6, curve: Curves.easeOut)),
    );

    _biteWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.6, 0.85, curve: Curves.easeOut)),
    );

    _emojiScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.85, 1.0, curve: Curves.elasticOut)),
    );
    _emojiFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.85, 0.95, curve: Curves.easeIn)),
    );

    _animController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            if (user.isAnonymous || user.emailVerified) {
              context.go('/scanner');
            } else {
              context.go('/verify-email');
            }
          } else {
            context.go('/onboarding');
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Widget _buildSvgWipe(String asset, Animation<double> widthAnim, double width, double height) {
    return AnimatedBuilder(
      animation: widthAnim,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: widthAnim.value,
            child: SvgPicture.asset(asset, width: width, height: height, fit: BoxFit.contain),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double logoWidth = 260;
    const double logoHeight = logoWidth * (1370 / 2400);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              // Animated SVG Logo Stack
              SizedBox(
                width: logoWidth,
                height: logoHeight,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animController,
                      builder: (context, child) {
                        return FractionalTranslation(
                          translation: _glassSlide.value,
                          child: Opacity(
                            opacity: _glassFade.value,
                            child: SvgPicture.asset('assets/images/anim_magnifying_glass.svg', width: logoWidth, height: logoHeight, fit: BoxFit.contain),
                          ),
                        );
                      },
                    ),
                    _buildSvgWipe('assets/images/anim_text_halal.svg', _halalWidth, logoWidth, logoHeight),
                    _buildSvgWipe('assets/images/anim_text_bite.svg', _biteWidth, logoWidth, logoHeight),
                    AnimatedBuilder(
                      animation: _animController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _emojiScale.value,
                          alignment: const Alignment(0.8, -0.6),
                          child: Opacity(
                            opacity: _emojiFade.value,
                            child: SvgPicture.asset('assets/images/anim_emoji.svg', width: logoWidth, height: logoHeight, fit: BoxFit.contain),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              // App Name (Faded in)
              AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  return Opacity(
                    opacity: ((_animController.value - 0.8) * 5).clamp(0.0, 1.0),
                    child: Column(
                      children: [
                        Text(
                          'Halal Bite',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                                letterSpacing: 1.2,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Trust Every Bite.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 18,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(flex: 3),
              // Bottom branding
              AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  return Opacity(
                    opacity: ((_animController.value - 0.8) * 5).clamp(0.0, 1.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        children: [
                          Text(
                            'Powered by Intellegentia Solutions',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textHint,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'v1.0.0',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textHint.withValues(alpha: 0.5),
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
