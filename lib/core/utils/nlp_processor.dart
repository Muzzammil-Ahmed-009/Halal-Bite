/// Core Utility: NLP Processor
/// Handles the cleaning, normalization, and tokenization of raw OCR text.
library;

class NlpProcessor {
  /// Cleans the raw OCR string and splits it into discrete ingredient tokens.
  /// 
  /// Complexities:
  /// Time: O(N) where N is the length of the string for Regex replacements.
  /// Space: O(T) where T is the number of tokens extracted.
  static List<String> tokenizeIngredients(String rawText) {
    if (rawText.isEmpty) return [];

    // 1. Convert to lowercase for uniform processing.
    String normalizedText = rawText.toLowerCase();

    // 2. Remove common noise characters introduced by OCR (e.g., brackets, stray punctuation)
    // We keep letters, numbers, spaces, commas, and hyphens.
    normalizedText = normalizedText.replaceAll(RegExp(r'[^a-z0-9\s,\-]'), '');

    // 3. Handle common OCR missing spaces (e.g., "sugar,water" -> "sugar, water")
    // Replace newlines with commas just in case ingredients are listed vertically.
    normalizedText = normalizedText.replaceAll('\n', ',');

    // 4. Tokenize by comma or common separators (e.g., 'and', '&')
    // We split by comma first.
    List<String> rawTokens = normalizedText.split(',');

    List<String> cleanTokens = [];

    for (var token in rawTokens) {
      // Clean up whitespace around the token
      var trimmed = token.trim();
      
      // Filter out empty strings or highly improbable short noise (e.g., single stray characters unless it's an E-code)
      if (trimmed.length > 1 || RegExp(r'e[0-9]{3}').hasMatch(trimmed)) {
        // Optional: Further split by 'and' if multiple ingredients share a clause without a comma
        // e.g., "sugar and water"
        if (trimmed.contains(' and ')) {
          var subTokens = trimmed.split(' and ');
          cleanTokens.addAll(subTokens.map((e) => e.trim()).where((e) => e.isNotEmpty));
        } else {
          cleanTokens.add(trimmed);
        }
      }
    }

    return cleanTokens;
  }
}
