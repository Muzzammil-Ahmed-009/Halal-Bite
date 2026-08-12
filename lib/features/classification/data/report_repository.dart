import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
    FirebaseAuth.instance,
  );
});

class ReportRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final FirebaseAuth _auth;

  ReportRepository(this._firestore, this._storage, this._auth);

  Future<void> submitReport({
    required String reportType,
    required String userComment,
    required String aiResponse,
    required String productName,
    String? imagePath,
  }) async {
    final user = _auth.currentUser;
    final userId = user?.uid ?? 'unauthenticated';
    String? imageUrl;

    try {
      // 1. Upload image to Firebase Storage if provided
      if (imagePath != null && imagePath.isNotEmpty) {
        final file = File(imagePath);
        if (await file.exists()) {
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          final storageRef = _storage.ref().child('reports').child(userId).child('$timestamp.jpg');
          
          final uploadTask = await storageRef.putFile(file);
          imageUrl = await uploadTask.ref.getDownloadURL();
        }
      }

      // 2. Save report metadata to Firestore
      final reportData = {
        'userId': userId,
        'productName': productName,
        'reportType': reportType,
        'userComment': userComment,
        'aiResponse': aiResponse,
        'imageUrl': imageUrl,
        'status': 'pending', // Default admin status
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('reports').add(reportData);
    } catch (e) {
      debugPrint('Error submitting report: $e');
      rethrow;
    }
  }
}
