import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_database_service.dart';
import '../../../core/database/models/local_ingredient.dart';
import '../../profile/data/preferences_repository.dart';
import '../data/gemini_service.dart';
import 'engines/confidence_engine.dart';
import 'engines/deterministic_rule_engine.dart';
import 'engines/normalization_engine.dart';
import 'ingredient_model.dart';

final classificationEngineProvider = Provider<ClassificationEngine>((ref) {
  final prefs = ref.watch(preferencesProvider);
  return ClassificationEngine(prefs);
});

class ClassificationEngine {
  final UserPreferences _prefs;

  ClassificationEngine(this._prefs);

  bool _isAnimalDerived(String name) {
    final lower = name.toLowerCase();
    return lower.contains('gelatin') || lower.contains('carmine') || 
           lower.contains('shellac') || lower.contains('meat') || 
           lower.contains('beef') || lower.contains('chicken');
  }

  bool _isDairy(String name) {
    final lower = name.toLowerCase();
    return lower.contains('dairy') || lower.contains('milk') ||
           lower.contains('whey') || lower.contains('casein') || 
           lower.contains('lactose') || lower.contains('cheese') ||
           lower.contains('butter');
  }

  bool _isNut(String name) {
    final lower = name.toLowerCase();
    return lower.contains('nut') || lower.contains('almond') || 
           lower.contains('cashew') || lower.contains('pecan') || 
           lower.contains('walnut') || lower.contains('pistachio');
  }

  Future<ProductClassificationResult> evaluateProduct(List<String> rawTokens, {bool isFromBarcode = false}) async {
    final isar = IsarDatabaseService.isar;
    Set<String> warnings = {};
    
    // 1. Normalize Tokens
    final normalizedTokens = rawTokens.map((t) => NormalizationEngine.normalizeAlias(t)).toList();

    List<LocalIngredient> localMatches = [];
    List<String> unknownTokens = [];

    // 2. Search Local DB (Isar)
    for (String token in normalizedTokens) {
      final match = await isar.localIngredients.filter()
          .nameEqualTo(token, caseSensitive: false)
          .or()
          .aliasesElementEqualTo(token, caseSensitive: false)
          .findFirst();
          
      if (match != null) {
        localMatches.add(match);
      } else {
        unknownTokens.add(token);
      }
    }

    // Convert local matches to Domain model
    List<Ingredient> allMatched = _mapLocalToDomain(localMatches);

    // 3. Delegate unknown to Gemini AI (Reasoning Assistant)
    if (unknownTokens.isNotEmpty) {
      // AI extracts scientific facts and possible sources, but does NOT make Halal/Haram decisions.
      List<Ingredient> aiResults = await GeminiService.evaluateUnknownIngredients(unknownTokens);
      allMatched.addAll(aiResults);
    }

    // 4. Deterministic Rule Engine (Judge)
    // The engine evaluates all ingredients (both local and AI-extracted) based on complex rules and sources.
    DeterministicRuleEngine.evaluateRules(allMatched);

    // Helper to evaluate warnings and status overrides for dietary preferences
    bool evaluateDietary(String name, String? category, bool? isAnimal, String currentStatus) {
      bool overrideToHaram = false;
      
      if (_prefs.veganMode && (_isAnimalDerived(name) || (isAnimal == true))) {
        overrideToHaram = true;
        warnings.add('Haram for you: Contains animal-derived ingredient ($name) and you have Vegan Mode enabled.');
      } 
      if (_prefs.lactoseIntolerant && (_isDairy(name) || category == 'dairy')) {
        warnings.add('Health Warning: Contains dairy/lactose ($name). Not recommended for Lactose Intolerant users.');
      } 
      if (_prefs.nutAllergy && (_isNut(name) || category == 'nuts')) {
        warnings.add('Health Warning: Contains nuts ($name). Dangerous for Nut Allergy.');
      } 
      if (_prefs.strictHalal && currentStatus == 'mushbooh') {
        overrideToHaram = true;
        warnings.add('Haram for you: Contains Mushbooh ingredient ($name) and you have Strict Halal enabled.');
      }
      
      return overrideToHaram;
    }

    // 5. Apply Dietary Rules & Overrides
    for (int i = 0; i < allMatched.length; i++) {
      final match = allMatched[i];
      // For local matches, we don't have category/animalDerived mapped perfectly in Ingredient right now unless we extend it,
      // but we fallback to name checks via _isAnimalDerived.
      bool forceHaram = evaluateDietary(match.name, null, null, match.status.name);
      
      if (forceHaram) {
        match.status = IngredientStatus.haram;
      }
    }

    // 6. Aggregate Final Status
    bool finalHasHaram = allMatched.any((i) => i.status == IngredientStatus.haram);
    bool finalHasMushbooh = allMatched.any((i) => i.status == IngredientStatus.mushbooh);
    bool finalHasUnknown = allMatched.any((i) => i.status == IngredientStatus.unknown);

    IngredientStatus finalStatus;
    if (finalHasHaram) {
      finalStatus = IngredientStatus.haram;
    } else if (finalHasMushbooh) {
      finalStatus = IngredientStatus.mushbooh;
    } else if (finalHasUnknown) {
      finalStatus = IngredientStatus.unknown;
    } else {
      finalStatus = IngredientStatus.halal;
    }

    // 7. Calculate Confidence
    final confidence = ConfidenceEngine.calculateConfidence(
      totalIngredients: normalizedTokens.length,
      unknownIngredientsCount: allMatched.where((r) => r.id == 'ai_generated' || r.id == 'ai_failed').length,
      isFromBarcode: isFromBarcode,
      hasVagueIngredients: normalizedTokens.any((t) => t.contains('flavor') || t.contains('spice')),
    );

    return ProductClassificationResult(
      overallStatus: finalStatus,
      matchedIngredients: allMatched.where((r) => r.status != IngredientStatus.unknown).toList(),
      unknownIngredients: allMatched.where((r) => r.status == IngredientStatus.unknown).map((r) => r.name).toList(),
      confidenceScore: confidence,
      dietaryWarnings: warnings.toList(),
    );
  }

  List<Ingredient> _mapLocalToDomain(List<LocalIngredient> localList) {
    return localList.map((l) {
      IngredientStatus s;
      switch (l.status) {
        case 'halal': s = IngredientStatus.halal; break;
        case 'haram': s = IngredientStatus.haram; break;
        case 'mushbooh': s = IngredientStatus.mushbooh; break;
        default: s = IngredientStatus.unknown;
      }
      return Ingredient(
        id: l.firestoreId, 
        name: l.name, 
        status: s,
        possibleSources: l.possibleSources ?? [],
        eNumber: l.eNumber,
        scientificName: l.scientificName,
        explanation: l.explanation,
      );
    }).toList();
  }
}
