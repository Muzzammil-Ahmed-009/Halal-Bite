import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/analytics_service.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<_OnboardingItem> _getItems(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return [
      _OnboardingItem(
        imagePath: 'assets/images/onboarding_scan.png',
        title: l10n.onboardingTitle1,
        subtitle: l10n.onboardingSubtitle1,
      ),
      _OnboardingItem(
        imagePath: 'assets/images/onboarding_ai.png',
        title: l10n.onboardingTitle2,
        subtitle: l10n.onboardingSubtitle2,
      ),
      _OnboardingItem(
        imagePath: 'assets/images/onboarding_diet.png',
        title: l10n.onboardingTitle3,
        subtitle: l10n.onboardingSubtitle3,
      ),
      _OnboardingItem(
        imagePath: 'assets/images/onboarding_expert.png',
        title: l10n.onboardingTitle4,
        subtitle: l10n.onboardingSubtitle4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () => context.go('/auth'),
                  child: Text(
                    AppLocalizations.of(context).skip,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemCount: _getItems(context).length,
                itemBuilder: (context, index) {
                  final item = _getItems(context)[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        // Premium Image
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.15),
                                blurRadius: 40,
                                offset: const Offset(0, 20),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(item.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item.subtitle,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _getItems(context).length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == i ? 32 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? AppColors.primary : AppColors.cardBorder,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 48, 28, 32),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _getItems(context).length - 1) {
                      ref.read(analyticsServiceProvider).logOnboardingCompleted();
                      context.go('/auth');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    _currentPage == _getItems(context).length - 1 ? AppLocalizations.of(context).getStarted : AppLocalizations.of(context).continueBtn,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingItem {
  final String imagePath;
  final String title;
  final String subtitle;
  _OnboardingItem({required this.imagePath, required this.title, required this.subtitle});
}
