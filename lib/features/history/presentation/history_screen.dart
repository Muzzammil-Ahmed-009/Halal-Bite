import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../classification/domain/ingredient_model.dart';
import '../data/history_repository.dart';
import '../../../core/utils/firebase_error_handler.dart';

enum _FilterType { all, safe, flagged }

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  _FilterType _currentFilter = _FilterType.all;

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      if (date.day != now.day) return '${AppLocalizations.of(context).yesterday}, ${_formatTime(date)}';
      return '${AppLocalizations.of(context).today}, ${_formatTime(date)}';
    } else if (difference.inDays == 1) {
      return '${AppLocalizations.of(context).yesterday}, ${_formatTime(date)}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  String _formatTime(DateTime date) {
    String hour = date.hour > 12 ? '${date.hour - 12}' : '${date.hour == 0 ? 12 : date.hour}';
    String minute = date.minute.toString().padLeft(2, '0');
    String ampm = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $ampm';
  }

  @override
  Widget build(BuildContext context) {
    final isAnonymous = FirebaseAuth.instance.currentUser?.isAnonymous ?? false;

    if (isAnonymous) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(AppLocalizations.of(context).scanHistory)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_rounded, size: 64, color: AppColors.textHint),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).loginToViewHistory,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/auth'),
                  child: Text(AppLocalizations.of(context).signInOrCreateAccount),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final historyAsync = ref.watch(historyStreamProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(AppLocalizations.of(context).scanHistory)),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              FirebaseErrorHandler.getFriendlyMessage(err),
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 16),
            ),
          ),
        ),
        data: (pastScans) {
          
          List<ScanEntry> filteredScans;
          switch (_currentFilter) {
            case _FilterType.all:
              filteredScans = pastScans;
              break;
            case _FilterType.safe:
              filteredScans = pastScans.where((s) => s.status == IngredientStatus.halal).toList();
              break;
            case _FilterType.flagged:
              filteredScans = pastScans.where((s) => s.status == IngredientStatus.haram || s.status == IngredientStatus.mushbooh).toList();
              break;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats bar (Interactive)
              Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(
                      value: '${pastScans.length}',
                      label: AppLocalizations.of(context).total,
                      isActive: _currentFilter == _FilterType.all,
                      onTap: () => setState(() => _currentFilter = _FilterType.all),
                    ),
                    Container(width: 1, height: 36, color: Colors.white24),
                    _buildStatItem(
                      value: '${pastScans.where((s) => s.status == IngredientStatus.halal).length}',
                      label: AppLocalizations.of(context).safe,
                      isActive: _currentFilter == _FilterType.safe,
                      onTap: () => setState(() => _currentFilter = _FilterType.safe),
                    ),
                    Container(width: 1, height: 36, color: Colors.white24),
                    _buildStatItem(
                      value: '${pastScans.where((s) => s.status == IngredientStatus.haram || s.status == IngredientStatus.mushbooh).length}',
                      label: AppLocalizations.of(context).flagged,
                      isActive: _currentFilter == _FilterType.flagged,
                      onTap: () => setState(() => _currentFilter = _FilterType.flagged),
                    ),
                  ],
                ),
              ),

              // Recent label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _currentFilter == _FilterType.all ? AppLocalizations.of(context).recentScans : 
                      _currentFilter == _FilterType.safe ? AppLocalizations.of(context).safeItems : AppLocalizations.of(context).flaggedItems,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('${filteredScans.length} ${AppLocalizations.of(context).items}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // List
              Expanded(
                child: filteredScans.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/empty_history.png', width: 240, height: 240),
                            const SizedBox(height: 24),
                            Text(
                              AppLocalizations.of(context).emptyHistory,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: filteredScans.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final scan = filteredScans[index];
                          return Dismissible(
                            key: Key(scan.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: AppColors.haram,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(Icons.delete_rounded, color: Colors.white),
                            ),
                            onDismissed: (direction) {
                              ref.read(historyRepositoryProvider).deleteScan(scan.id);
                            },
                            child: _ScanCard(
                              scan: scan,
                              formattedDate: _formatDate(scan.date),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanCard extends StatelessWidget {
  final ScanEntry scan;
  final String formattedDate;

  const _ScanCard({required this.scan, required this.formattedDate});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusLabel;
    switch (scan.status) {
      case IngredientStatus.halal:
        statusColor = AppColors.halal;
        statusLabel = AppLocalizations.of(context).halalLabel;
        break;
      case IngredientStatus.haram:
        statusColor = AppColors.haram;
        statusLabel = AppLocalizations.of(context).haramLabel;
        break;
      case IngredientStatus.mushbooh:
        statusColor = AppColors.mushbooh;
        statusLabel = AppLocalizations.of(context).doubtfulLabel;
        break;
      case IngredientStatus.unknown:
        statusColor = AppColors.unknown;
        statusLabel = AppLocalizations.of(context).unknownLabel;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          // Status indicator
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              scan.status == IngredientStatus.halal ? Icons.check_circle_rounded :
              scan.status == IngredientStatus.haram ? Icons.cancel_rounded : Icons.help_rounded,
              color: statusColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(scan.productName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 4),
                Text(
                  '${AppLocalizations.of(context).ingredientsAnalyzed(scan.ingredientCount)} • $formattedDate',
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          // Status chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              statusLabel,
              style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
