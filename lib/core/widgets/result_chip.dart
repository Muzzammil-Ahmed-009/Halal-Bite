import 'package:flutter/material.dart';
import '../../features/classification/domain/ingredient_model.dart';
import '../theme/app_colors.dart';

class ResultChip extends StatelessWidget {
  final String text;
  final IngredientStatus status;

  const ResultChip({super.key, required this.text, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case IngredientStatus.haram:
        bgColor = AppColors.haram.withValues(alpha: 0.15);
        textColor = AppColors.haram;
        break;
      case IngredientStatus.mushbooh:
        bgColor = AppColors.mushbooh.withValues(alpha: 0.15);
        textColor = AppColors.mushbooh;
        break;
      case IngredientStatus.halal:
        bgColor = AppColors.halal.withValues(alpha: 0.15);
        textColor = AppColors.halal;
        break;
      case IngredientStatus.unknown:
        bgColor = AppColors.unknown.withValues(alpha: 0.15);
        textColor = AppColors.textPrimary;
        break;
    }

    return Chip(
      label: Text(text),
      backgroundColor: bgColor,
      labelStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
