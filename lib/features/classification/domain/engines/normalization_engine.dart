class NormalizationEngine {
  /// Cleans OCR text by removing unnecessary brackets, percentages, and artifact characters.
  static String cleanOcrText(String rawText) {
    var cleaned = rawText.replaceAll(RegExp(r'\[.*?\]|\(.*?\)'), ''); // Remove text in brackets
    cleaned = cleaned.replaceAll(RegExp(r'\d+%'), ''); // Remove percentages
    cleaned = cleaned.replaceAll(RegExp(r'[^a-zA-Z0-9,\.\s]'), ''); // Keep only alphanumeric and standard punctuation
    return cleaned.trim();
  }

  /// Splits a block of cleaned text into individual ingredients.
  static List<String> splitIngredients(String cleanedText) {
    // Split by commas, full stops, or common separators like 'and'
    final tokens = cleanedText.split(RegExp(r',|\.| and | & '));
    return tokens
        .map((t) => t.trim().toLowerCase())
        .where((t) => t.isNotEmpty && t.length > 2)
        .toList();
  }

  /// Maps an unknown string to a standard search token.
  /// (e.g., "e471", "ins471", "mono and diglycerides" -> "e471")
  static String normalizeAlias(String rawIngredient) {
    var token = rawIngredient.toLowerCase().trim();
    
    // Remove 'ins' or 'e' prefix if followed by numbers (standardizing e-numbers)
    if (token.startsWith('ins') && int.tryParse(token.substring(3).trim()) != null) {
      token = 'e${token.substring(3).trim()}';
    } else if (token.startsWith('e ') && int.tryParse(token.substring(2).trim()) != null) {
      token = 'e${token.substring(2).trim()}';
    }
    
    // Example static mappings (these should ideally come from Isar eventually)
    if (token == 'gelatine') return 'gelatin';
    if (token.contains('mono') && token.contains('diglyceride')) return 'e471';

    return token;
  }
}
