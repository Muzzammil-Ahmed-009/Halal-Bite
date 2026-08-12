import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../classification/domain/ingredient_model.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(FirebaseFirestore.instance, FirebaseAuth.instance);
});

final favoritesStreamProvider = StreamProvider<List<FavoriteEntry>>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return repo.watchFavorites();
});

class FavoriteEntry {
  final String id;
  final String productName;
  final DateTime dateAdded;
  final IngredientStatus status;

  FavoriteEntry({
    required this.id,
    required this.productName,
    required this.dateAdded,
    required this.status,
  });

  factory FavoriteEntry.fromMap(Map<String, dynamic> map, String id) {
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

    return FavoriteEntry(
      id: id,
      productName: map['productName'] ?? 'Unknown Product',
      dateAdded: (map['dateAdded'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: parsedStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'dateAdded': Timestamp.fromDate(dateAdded),
      'status': status.toString().split('.').last,
    };
  }
}

class FavoritesRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FavoritesRepository(this._firestore, this._auth);

  CollectionReference<Map<String, dynamic>>? get _favoritesCollection {
    final user = _auth.currentUser;
    if (user == null) return null;
    return _firestore.collection('users').doc(user.uid).collection('favorites');
  }

  Future<void> addFavorite(ProductClassificationResult result, {required String productName}) async {
    final collection = _favoritesCollection;
    if (collection == null) return;

    final entry = FavoriteEntry(
      id: '',
      productName: productName,
      dateAdded: DateTime.now(),
      status: result.overallStatus,
    );

    // Use product name as doc ID to prevent duplicates
    final docId = productName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
    await collection.doc(docId).set(entry.toMap());
  }

  Future<void> removeFavorite(String productName) async {
    final collection = _favoritesCollection;
    if (collection == null) return;
    
    final docId = productName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
    await collection.doc(docId).delete();
  }

  Future<bool> isFavorite(String productName) async {
    final collection = _favoritesCollection;
    if (collection == null) return false;
    
    final docId = productName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
    final doc = await collection.doc(docId).get();
    return doc.exists;
  }

  Stream<List<FavoriteEntry>> watchFavorites() {
    final collection = _favoritesCollection;
    if (collection == null) return Stream.value([]);

    return collection
        .orderBy('dateAdded', descending: true)
        .snapshots()
        .map((snapshot) => 
            snapshot.docs.map((doc) => FavoriteEntry.fromMap(doc.data(), doc.id)).toList());
  }
}
