import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/ingredient_model.dart';

final ingredientRepositoryProvider = Provider<IngredientRepository>((ref) {
  return IngredientRepository(FirebaseFirestore.instance);
});

class IngredientRepository {
  final FirebaseFirestore _firestore;
  
  // Cache the dictionary in memory after fetching from offline/online
  List<Ingredient> _cachedIngredients = [];

  IngredientRepository(this._firestore) {
    // CRITICAL: Enable offline persistence so the app can function without active internet
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  /// Fetches all ingredients from Firestore (or local cache).
  Future<List<Ingredient>> getAllIngredients() async {
    if (_cachedIngredients.isNotEmpty) {
      return _cachedIngredients;
    }

    try {
      final snapshot = await _firestore.collection('ingredients').get();
      _cachedIngredients = snapshot.docs
          .map((doc) => Ingredient.fromMap(doc.data(), doc.id))
          .toList();
      return _cachedIngredients;
    } catch (e) {
      // Return empty list or handle error appropriately in production
      return [];
    }
  }
}
