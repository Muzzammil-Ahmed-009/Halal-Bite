import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../classification/domain/ingredient_model.dart';
import '../../classification/data/ingredient_repository.dart';
import 'package:clearbite/l10n/app_localizations.dart';
import '../../../core/services/analytics_service.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  bool _hasQuery = false;
  bool _isLoading = true;
  List<Ingredient> _allCodes = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final repo = ref.read(ingredientRepositoryProvider);
    final data = await repo.getAllIngredients();
    if (mounted) {
      setState(() {
        _allCodes = data;
        _isLoading = false;
      });
    }
  }

  List<Ingredient> get _filtered {
    if (!_hasQuery) return _allCodes;
    final q = _controller.text.toLowerCase();
    return _allCodes.where((e) =>
      e.id.toLowerCase().contains(q) || e.name.toLowerCase().contains(q)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(AppLocalizations.of(context).ingredientSearch)),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: TextField(
              controller: _controller,
              onChanged: (v) => setState(() => _hasQuery = v.isNotEmpty),
              onSubmitted: (v) {
                if (v.trim().isNotEmpty) {
                  ref.read(analyticsServiceProvider).logSearchPerformed(query: v.trim());
                }
              },
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).searchHint,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _hasQuery
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded, size: 20),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _hasQuery = false);
                        },
                      )
                    : null,
              ),
            ),
          ),

          // Results
          Expanded(
            child: _isLoading 
                ? const Center(child: CircularProgressIndicator())
                : !_hasQuery
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/empty_search.png', width: 240, height: 240),
                          const SizedBox(height: 24),
                          Text(
                            AppLocalizations.of(context).searchEmptyState,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.textSecondary, fontSize: 16, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  )
                : _filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search_off_rounded, size: 64, color: AppColors.textHint),
                        const SizedBox(height: 12),
                        Text(AppLocalizations.of(context).noResultsFound, style: const TextStyle(color: AppColors.textSecondary, fontSize: 15)),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final entry = _filtered[index];
                      Color statusColor = entry.status == IngredientStatus.halal
                          ? AppColors.halal
                          : entry.status == IngredientStatus.haram
                              ? AppColors.haram
                              : entry.status == IngredientStatus.mushbooh
                                  ? AppColors.mushbooh
                                  : AppColors.unknown;

                      String statusText = entry.status == IngredientStatus.halal ? AppLocalizations.of(context).halalLabel :
                                          entry.status == IngredientStatus.haram ? AppLocalizations.of(context).haramLabel :
                                          entry.status == IngredientStatus.mushbooh ? AppLocalizations.of(context).doubtfulLabel :
                                          AppLocalizations.of(context).unknownLabel;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        leading: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              entry.id,
                              style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        title: Text(entry.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            statusText,
                            style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
