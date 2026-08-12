import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../classification/domain/ingredient_model.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepository(FirebaseFirestore.instance, FirebaseAuth.instance);
});

// A stream provider to automatically listen to real-time changes in the user's history
final historyStreamProvider = StreamProvider<List<ScanEntry>>((ref) {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.watchScanHistory();
});

class ScanEntry {
  final String id;
  final String productName;
  final DateTime date;
  final IngredientStatus status;
  final int ingredientCount;

  ScanEntry({
    required this.id,
    required this.productName,
    required this.date,
    required this.status,
    required this.ingredientCount,
  });

  factory ScanEntry.fromMap(Map<String, dynamic> map, String id) {
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

    return ScanEntry(
      id: id,
      productName: map['productName'] ?? 'Unknown Product',
      date: (map['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: parsedStatus,
      ingredientCount: map['ingredientCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'date': Timestamp.fromDate(date),
      'status': status.toString().split('.').last,
      'ingredientCount': ingredientCount,
    };
  }
}

class HistoryRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  HistoryRepository(this._firestore, this._auth);

  CollectionReference<Map<String, dynamic>>? get _historyCollection {
    final user = _auth.currentUser;
    if (user == null) return null;
    return _firestore.collection('users').doc(user.uid).collection('scan_history');
  }

  /// Saves a scan result to Firestore
  Future<void> saveScan(ProductClassificationResult result, {String productName = "Scanned Product"}) async {
    final collection = _historyCollection;
    if (collection == null) return; // User not logged in

    final totalIngredients = result.matchedIngredients.length + result.unknownIngredients.length;

    final entry = ScanEntry(
      id: '', // Firestore auto-generates ID
      productName: productName,
      date: DateTime.now(),
      status: result.overallStatus,
      ingredientCount: totalIngredients,
    );

    await collection.add(entry.toMap());
  }

  /// Watches the scan history for real-time updates
  Stream<List<ScanEntry>> watchScanHistory() {
    final collection = _historyCollection;
    if (collection == null) return Stream.value([]);

    return collection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => 
            snapshot.docs.map((doc) => ScanEntry.fromMap(doc.data(), doc.id)).toList());
  }
  
  /// Deletes a specific scan entry
  Future<void> deleteScan(String id) async {
    final collection = _historyCollection;
    if (collection == null) return;
    
    await collection.doc(id).delete();
  }
}
