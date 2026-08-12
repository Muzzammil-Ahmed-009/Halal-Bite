import '../ingredient_model.dart';

class DeterministicRuleEngine {
  /// Evaluates the final status of ingredients based on predefined rules and possible sources.
  static void evaluateRules(List<Ingredient> ingredients) {
    for (var ingredient in ingredients) {
      // If it already has a firm status from the local verified DB (halal or haram), 
      // we usually trust it. But we can still apply dynamic rules for unknowns or mushbooh.
      
      if (ingredient.status == IngredientStatus.unknown || ingredient.status == IngredientStatus.mushbooh) {
        final name = ingredient.name.toLowerCase();
        final sources = ingredient.possibleSources.map((s) => s.toLowerCase()).toList();

        // Rule 1: Gelatin
        if (name.contains('gelatin') || name.contains('gelatine')) {
          if (sources.contains('pig') || sources.contains('porcine') || sources.contains('pork')) {
            ingredient.status = IngredientStatus.haram;
          } else if (sources.length == 1 && (sources.contains('fish') || sources.contains('bovine (halal certified)'))) {
            ingredient.status = IngredientStatus.halal;
          } else {
            ingredient.status = IngredientStatus.mushbooh; // Unknown source = needs verification
          }
          continue; // Rule applied
        }

        // Rule 2: Carmine (Insects)
        if (name.contains('carmine') || name.contains('cochineal') || ingredient.eNumber == 'e120') {
          ingredient.status = IngredientStatus.haram;
          continue;
        }

        // Rule 3: Alcohol
        if (name.contains('alcohol') || name.contains('ethanol') || name.contains('liquor') || name.contains('wine')) {
          if (!name.contains('sugar alcohol')) { // Sugar alcohols are generally halal
             ingredient.status = IngredientStatus.haram;
             continue;
          }
        }

        // Generic Source Rules
        if (sources.contains('pig') || sources.contains('porcine') || sources.contains('pork')) {
          ingredient.status = IngredientStatus.haram;
        } else if (sources.contains('cow') || sources.contains('bovine') || sources.contains('animal')) {
           // Any uncertified animal source is Mushbooh
           ingredient.status = IngredientStatus.mushbooh;
        } else if (sources.every((s) => s == 'plant' || s == 'synthetic' || s == 'microbial' || s == 'mineral' || s == 'fish')) {
           if (sources.isNotEmpty) {
             ingredient.status = IngredientStatus.halal;
           }
        }
      }
    }
  }
}
