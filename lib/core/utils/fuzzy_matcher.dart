/// Core Utility: Fuzzy Matcher
/// Implements string similarity algorithms to handle OCR imperfections.
library;

import 'dart:math';

class FuzzyMatcher {
  /// Calculates the Levenshtein distance between two strings.
  /// 
  /// The Levenshtein distance is a string metric for measuring the difference 
  /// between two sequences. Informally, it is the minimum number of single-character 
  /// edits (insertions, deletions or substitutions) required to change one word into the other.
  /// 
  /// Big-O Complexity:
  /// Time: O(N * M) where N and M are the lengths of the strings.
  /// Space: O(N * M) (Can be optimized to O(min(N,M)) if memory becomes a bottleneck).
  static int _levenshteinDistance(String s1, String s2) {
    if (s1 == s2) return 0;
    if (s1.isEmpty) return s2.length;
    if (s2.isEmpty) return s1.length;

    // Create a 2D matrix
    List<List<int>> matrix = List.generate(
      s1.length + 1,
      (i) => List.generate(s2.length + 1, (j) => 0),
    );

    // Initialize first row and column
    for (int i = 0; i <= s1.length; i++) {
      matrix[i][0] = i;
    }
    for (int j = 0; j <= s2.length; j++) {
      matrix[0][j] = j;
    }

    // Fill the matrix
    for (int i = 1; i <= s1.length; i++) {
      for (int j = 1; j <= s2.length; j++) {
        int cost = (s1[i - 1] == s2[j - 1]) ? 0 : 1;

        matrix[i][j] = min(
          matrix[i - 1][j] + 1, // Deletion
          min(
            matrix[i][j - 1] + 1, // Insertion
            matrix[i - 1][j - 1] + cost, // Substitution
          ),
        );
      }
    }

    return matrix[s1.length][s2.length];
  }

  /// Calculates a similarity score between 0.0 and 1.0
  /// 
  /// Returns 1.0 for an exact match, and 0.0 if the strings are completely different.
  static double calculateSimilarity(String scannedToken, String databaseEntry) {
    if (scannedToken.isEmpty || databaseEntry.isEmpty) return 0.0;
    
    int distance = _levenshteinDistance(scannedToken, databaseEntry);
    int maxLength = max(scannedToken.length, databaseEntry.length);
    
    if (maxLength == 0) return 1.0;
    
    return (maxLength - distance) / maxLength;
  }

  /// Checks if the scanned token matches a database entry with a similarity >= 85%
  /// 
  /// Example: 'Gelatln' vs 'gelatin' -> returns true.
  static bool isMatch(String scannedToken, String databaseEntry, {double threshold = 0.85}) {
    // Exact match fast-path to save computation
    if (scannedToken.toLowerCase() == databaseEntry.toLowerCase()) {
      return true; 
    }

    double score = calculateSimilarity(scannedToken.toLowerCase(), databaseEntry.toLowerCase());
    return score >= threshold;
  }

  /// Finds the best matching ingredient from a list of database ingredients.
  /// Returns the matched string if found, otherwise returns null.
  static String? findBestMatch(String scannedToken, List<String> databaseEntries, {double threshold = 0.85}) {
    String? bestMatch;
    double highestScore = 0.0;

    for (var entry in databaseEntries) {
      double score = calculateSimilarity(scannedToken.toLowerCase(), entry.toLowerCase());
      
      // Exact match fast-path
      if (score == 1.0) return entry;

      if (score > highestScore && score >= threshold) {
        highestScore = score;
        bestMatch = entry;
      }
    }

    return bestMatch;
  }
}
