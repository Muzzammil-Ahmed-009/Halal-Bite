enum IngredientStatus { halal, haram, mushbooh, unknown }

class Ingredient {
  final String id;
  final String name;
  IngredientStatus status;
  final List<String> possibleSources;
  final String? eNumber;
  final String? scientificName;
  final String? explanation;

  Ingredient({
    required this.id,
    required this.name,
    required this.status,
    this.possibleSources = const [],
    this.eNumber,
    this.scientificName,
    this.explanation,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map, String id) {
    IngredientStatus parsedStatus;
    switch (map['status']?.toString().toLowerCase()) {
      case 'halal':
        parsedStatus = IngredientStatus.halal;
        break;
      case 'haram':
        parsedStatus = IngredientStatus.haram;
        break;
      case 'mushbooh':
        parsedStatus = IngredientStatus.mushbooh;
        break;
      default:
        parsedStatus = IngredientStatus.unknown;
    }

    return Ingredient(
      id: id,
      name: map['name'] ?? '',
      status: parsedStatus,
      possibleSources: List<String>.from(map['possibleSources'] ?? []),
      eNumber: map['eNumber'],
      scientificName: map['scientificName'],
      explanation: map['explanation'],
    );
  }
}

class ProductClassificationResult {
  final IngredientStatus overallStatus;
  final List<Ingredient> matchedIngredients;
  final List<String> unknownIngredients;
  final int confidenceScore; // 0 to 100
  final List<String> dietaryWarnings; // Warnings for lactose, nuts, vegan, etc.

  ProductClassificationResult({
    required this.overallStatus,
    required this.matchedIngredients,
    required this.unknownIngredients,
    this.confidenceScore = 100, // Default to 100 for existing mock data/history
    this.dietaryWarnings = const [],
  });
}
