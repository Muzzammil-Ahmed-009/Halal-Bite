import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/ingredient_model.dart';
import '../data/report_repository.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import '../../../core/services/analytics_service.dart';

class ResultBottomSheet extends ConsumerWidget {
  final ProductClassificationResult result;
  final String productName;
  final String? imagePath;

  const ResultBottomSheet({
    super.key, 
    required this.result, 
    this.productName = 'Scanned Product',
    this.imagePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (result.overallStatus) {
      case IngredientStatus.halal:
        statusColor = AppColors.halal;
        statusText = AppLocalizations.of(context).halalLabel;
        statusIcon = Icons.check_circle_rounded;
        break;
      case IngredientStatus.haram:
        statusColor = AppColors.haram;
        statusText = AppLocalizations.of(context).haramLabel;
        statusIcon = Icons.cancel_rounded;
        break;
      case IngredientStatus.mushbooh:
        statusColor = AppColors.mushbooh;
        statusText = AppLocalizations.of(context).doubtfulLabel;
        statusIcon = Icons.help_rounded;
        break;
      case IngredientStatus.unknown:
        statusColor = AppColors.unknown;
        statusText = AppLocalizations.of(context).unknownLabel;
        statusIcon = Icons.help_outline_rounded;
        break;
    }

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.cardBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // Status header
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: statusColor.withValues(alpha: 0.4), blurRadius: 12, spreadRadius: 2),
                          ],
                        ),
                        child: Icon(statusIcon, color: Colors.white, size: 36),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              statusText,
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${result.matchedIngredients.length + result.unknownIngredients.length} ${AppLocalizations.of(context).ingredientsAnalyzed}',
                              style: TextStyle(color: statusColor.withValues(alpha: 0.8), fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Confidence Score
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              value: result.confidenceScore / 100,
                              backgroundColor: Colors.grey.shade300,
                              color: _getConfidenceColor(result.confidenceScore),
                              strokeWidth: 6,
                            ),
                          ),
                          Text(
                            '${result.confidenceScore}%',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context).confidenceScoreLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(
                              _getConfidenceMessage(result.confidenceScore, context),
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Dietary Warnings
                if (result.dietaryWarnings.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.warning_amber_rounded, color: Colors.red),
                            const SizedBox(width: 8),
                            Text(AppLocalizations.of(context).healthWarningsLabel, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...result.dietaryWarnings.map((warning) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              Expanded(child: Text(warning, style: const TextStyle(color: Colors.red, fontSize: 13))),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Ingredients Accordion
                if (result.matchedIngredients.isNotEmpty || result.unknownIngredients.isNotEmpty) ...[
                  Text(AppLocalizations.of(context).detailedAnalysis, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...result.matchedIngredients.map((ing) => _buildIngredientCard(ing, context)),
                  ...result.unknownIngredients.map((u) => _buildUnknownCard(u, context)),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(AppLocalizations.of(context).scanAnother, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Close Result Bottom Sheet
                    _showReportBottomSheet(context, ref);
                  },
                  icon: const Icon(Icons.flag_rounded, size: 18, color: AppColors.textSecondary),
                  label: Text(AppLocalizations.of(context).reportIncorrect, style: const TextStyle(color: AppColors.textSecondary)),
                ),
              ],
            ),
          ),
          
          // Disclaimer
          Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: Text(
              AppLocalizations.of(context).disclaimer,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textHint,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(int score) {
    if (score >= 90) return AppColors.halal;
    if (score >= 70) return Colors.orange;
    return AppColors.haram;
  }

  String _getConfidenceMessage(int score, BuildContext context) {
    if (score >= 90) return AppLocalizations.of(context).confidenceHigh;
    if (score >= 70) return AppLocalizations.of(context).confidenceModerate;
    return AppLocalizations.of(context).confidenceLow;
  }

  Widget _buildIngredientCard(Ingredient ing, BuildContext context) {
    Color cardColor;
    switch (ing.status) {
      case IngredientStatus.halal: cardColor = AppColors.halal; break;
      case IngredientStatus.haram: cardColor = AppColors.haram; break;
      case IngredientStatus.mushbooh: cardColor = AppColors.mushbooh; break;
      case IngredientStatus.unknown: cardColor = AppColors.unknown; break;
    }

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cardColor.withValues(alpha: 0.3)),
      ),
      child: ExpansionTile(
        title: Text(ing.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: Icon(
          ing.status == IngredientStatus.halal ? Icons.check_circle :
          ing.status == IngredientStatus.haram ? Icons.cancel : Icons.help,
          color: cardColor,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: cardColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                child: Text(ing.status.name.toUpperCase(), style: TextStyle(color: cardColor, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context).matchedIsar, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          Text(AppLocalizations.of(context).explanation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(AppLocalizations.of(context).explanationIsar, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildUnknownCard(String name, BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.unknown.withValues(alpha: 0.3)),
      ),
      child: ExpansionTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: const Icon(Icons.help_outline, color: AppColors.unknown),
        childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.unknown.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                child: Text(AppLocalizations.of(context).aiInferred, style: const TextStyle(color: AppColors.unknown, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(AppLocalizations.of(context).explanation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(AppLocalizations.of(context).explanationGemini, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  void _showReportBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ReportBottomSheet(
        result: result,
        productName: productName,
        imagePath: imagePath,
      ),
    );
  }
}

class _ReportBottomSheet extends ConsumerStatefulWidget {
  final ProductClassificationResult result;
  final String productName;
  final String? imagePath;

  const _ReportBottomSheet({
    required this.result,
    required this.productName,
    this.imagePath,
  });

  @override
  ConsumerState<_ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends ConsumerState<_ReportBottomSheet> {
  String _selectedReportType = 'AI is wrong (Incorrect Status)';
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;

  final List<String> _reportTypes = [
    'AI is wrong (Incorrect Status)',
    'Missing or Misread Ingredient',
    'Ask a Scholar (Doubtful/Complex Item)',
  ];

  Future<void> _submitReport() async {
    setState(() => _isSubmitting = true);
    try {
      // Build a simple string representation of the AI Response
      final aiResponse = 'Overall: ${widget.result.overallStatus.name}\\n'
          'Confidence: ${widget.result.confidenceScore}%\\n'
          'Matched: ${widget.result.matchedIngredients.map((i) => i.name).join(', ')}\\n'
          'Unknown: ${widget.result.unknownIngredients.join(', ')}';

      await ref.read(reportRepositoryProvider).submitReport(
        reportType: _selectedReportType,
        userComment: _commentController.text.trim(),
        aiResponse: aiResponse,
        productName: widget.productName,
        imagePath: widget.imagePath,
      );

      await ref.read(analyticsServiceProvider).logMistakeReported(
        reportType: _selectedReportType,
        ingredientId: widget.productName,
      );

      if (mounted) {
        Navigator.pop(context); // Close bottom sheet
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).reportSubmitted),
            backgroundColor: AppColors.halal,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting report: $e'),
            backgroundColor: AppColors.haram,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.cardBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            Text(AppLocalizations.of(context).reportInaccuracy, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context).reportInaccuracyBody,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
            const SizedBox(height: 24),

            // Report Types
            ..._reportTypes.map((type) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: () => setState(() => _selectedReportType = type),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _selectedReportType == type ? AppColors.primary : AppColors.cardBorder),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _selectedReportType == type ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        color: _selectedReportType == type ? AppColors.primary : AppColors.textHint,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(type, style: const TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
            )),
            
            const SizedBox(height: 16),
            
            // Comment Field
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).addCommentsOptional,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.cardBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.cardBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Submit Button
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : Text(AppLocalizations.of(context).submitReport, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
