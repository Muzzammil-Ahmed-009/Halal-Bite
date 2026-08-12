import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/theme/app_colors.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  bool _isEmailVerified = false;
  bool _canResendEmail = true;
  Timer? _checkTimer;
  Timer? _resendCooldownTimer;
  int _resendCooldown = 0;

  @override
  void initState() {
    super.initState();
    _isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

    if (!_isEmailVerified) {
      _sendVerificationEmail();
      _startAutoCheck();
    }
  }

  void _startAutoCheck() {
    _checkTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        _checkTimer?.cancel();
        if (mounted) {
          setState(() => _isEmailVerified = true);
          // Small delay to show success state
          await Future.delayed(const Duration(milliseconds: 800));
          if (mounted) {
            context.go('/scanner');
          }
        }
      }
    });
  }

  Future<void> _sendVerificationEmail() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send verification email: $e'),
            backgroundColor: AppColors.haram,
          ),
        );
      }
    }
  }

  Future<void> _resendEmail() async {
    if (!_canResendEmail) return;

    setState(() {
      _canResendEmail = false;
      _resendCooldown = 60;
    });

    await _sendVerificationEmail();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification email sent! Check your inbox.'),
          backgroundColor: AppColors.halal,
        ),
      );
    }

    // Cooldown timer (60 seconds)
    _resendCooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _resendCooldown--;
          if (_resendCooldown <= 0) {
            _canResendEmail = true;
            timer.cancel();
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _checkTimer?.cancel();
    _resendCooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _isEmailVerified
                      ? AppColors.halal.withValues(alpha: 0.1)
                      : AppColors.mushbooh.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isEmailVerified ? Icons.check_circle_rounded : Icons.mark_email_unread_rounded,
                  size: 72,
                  color: _isEmailVerified ? AppColors.halal : AppColors.mushbooh,
                ),
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                _isEmailVerified ? 'Email Verified!' : 'Verify Your Email',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                _isEmailVerified
                    ? 'Your account is now verified. Redirecting...'
                    : 'We\'ve sent a verification link to:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              if (!_isEmailVerified) ...[
                const SizedBox(height: 8),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please open your inbox, click the verification link, and this screen will update automatically.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Resend Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: _canResendEmail ? _resendEmail : null,
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(
                      _canResendEmail
                          ? 'Resend Verification Email'
                          : 'Resend in ${_resendCooldown}s',
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: _canResendEmail ? AppColors.primary : AppColors.textHint,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Change Account / Sign Out Button
                TextButton(
                  onPressed: () async {
                    final router = GoRouter.of(context);
                    await FirebaseAuth.instance.signOut();
                    router.go('/auth');
                  },
                  child: const Text(
                    'Use a different account',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],

              if (_isEmailVerified) ...[
                const SizedBox(height: 24),
                const CircularProgressIndicator(color: AppColors.halal),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
