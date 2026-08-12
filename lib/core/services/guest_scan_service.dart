import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guestScanServiceProvider = Provider<GuestScanService>((ref) {
  return GuestScanService(FirebaseFirestore.instance, FirebaseAuth.instance);
});

class GuestScanService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  GuestScanService(this._firestore, this._auth);

  DocumentReference? get _limitDoc {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;
    return _firestore.collection('users').doc(uid).collection('metadata').doc('limits');
  }

  Future<int> getScanCount() async {
    if (_auth.currentUser?.isAnonymous != true) return 0; // Registered users have unlimited
    try {
      final doc = await _limitDoc?.get();
      if (doc != null && doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return data['scanCount'] as int? ?? 0;
      }
    } catch (e) {
      debugPrint('Error loading scan count: $e');
    }
    return 0;
  }

  Future<bool> canScan() async {
    if (_auth.currentUser?.isAnonymous != true) return true;
    final count = await getScanCount();
    return count < 3;
  }

  Future<void> incrementScanCount() async {
    if (_auth.currentUser?.isAnonymous != true) return;
    try {
      await _limitDoc?.set({'scanCount': FieldValue.increment(1)}, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error incrementing scan count: $e');
    }
  }
}
