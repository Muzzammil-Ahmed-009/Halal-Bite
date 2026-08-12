import 'package:flutter/material.dart';

class AppColors {
  // Brand - ClearBite Custom
  static const Color primary = Color(0xFF1B6E4C);      // Primary Green
  static const Color primaryLight = Color(0xFF2A9165); // Lighter Green
  static const Color accent = Color(0xFFA32034);       // Primary Red

  // Surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE8ECF0);

  // Typography
  static const Color textPrimary = Color(0xFF0D1B2A); // Keep text dark for readability
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFFB0BEC5);

  // Status
  static const Color halal = Color(0xFF1B6E4C);       // Match Primary Green
  static const Color mushbooh = Color(0xFFFF9800);    // Keep Orange for Doubtful
  static const Color haram = Color(0xFFA32034);       // Match Primary Red
  static const Color unknown = Color(0xFF90A4AE);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1B6E4C), Color(0xFF2A9165)],
  );
}
