class ConfidenceEngine {
  /// Calculates the confidence score (0 to 100) based on the inputs and findings.
  static int calculateConfidence({
    required int totalIngredients,
    required int unknownIngredientsCount,
    required bool isFromBarcode,
    required bool hasVagueIngredients,
  }) {
    int score = 100;

    // Penalty for missing barcode data (relying purely on OCR is slightly less reliable)
    if (!isFromBarcode) {
      score -= 5;
    }

    // Penalty for vague ingredients like "natural flavors" or "spices"
    if (hasVagueIngredients) {
      score -= 10;
    }

    // Heavy penalty for completely unknown ingredients that fallback to AI
    if (totalIngredients > 0) {
      double unknownRatio = unknownIngredientsCount / totalIngredients;
      // E.g. if 1 out of 5 ingredients is unknown (20%), subtract 20 points
      score -= (unknownRatio * 100).toInt();
    }

    // Cap the score between 0 and 100
    if (score < 0) score = 0;
    if (score > 100) score = 100;

    return score;
  }
}
