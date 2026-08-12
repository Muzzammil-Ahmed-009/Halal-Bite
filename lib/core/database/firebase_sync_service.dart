import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

import 'models/app_metadata.dart';
import 'models/local_ingredient.dart';

class FirebaseSyncService {
  final FirebaseFirestore _firestore;
  final Isar _isar;

  FirebaseSyncService(this._firestore, this._isar);

  Future<void> syncDatabase() async {
    try {
      debugPrint('SyncService: Checking for database updates...');
      
      // 1. Fetch remote metadata
      final doc = await _firestore.collection('app_config').doc('database_metadata').get();
      if (!doc.exists || doc.data() == null) {
        debugPrint('SyncService: No metadata found in Firestore.');
        return;
      }
      
      final data = doc.data()!;
      final remoteVersion = data['latest_version'] as int? ?? 0;
      final downloadUrl = data['download_url'] as String?;
      final expectedHash = data['sha256_hash'] as String?;

      if (downloadUrl == null || expectedHash == null) {
        debugPrint('SyncService: Invalid metadata structure.');
        return;
      }

      // 2. Fetch local metadata
      var localMetadata = await _isar.appMetadatas.get(0);
      final localVersion = localMetadata?.currentDatabaseVersion ?? -1;

      if (remoteVersion <= localVersion) {
        debugPrint('SyncService: Database is up to date (v$localVersion).');
        return;
      }

      debugPrint('SyncService: Update available. Remote: v$remoteVersion, Local: v$localVersion');

      // 3. Download JSON
      final response = await http.get(Uri.parse(downloadUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download database JSON: ${response.statusCode}');
      }

      final bytes = response.bodyBytes;

      // 4. Verify Integrity (SHA256)
      final actualHash = sha256.convert(bytes).toString();
      if (actualHash != expectedHash) {
        throw Exception('SHA256 Hash mismatch! Expected: $expectedHash, Got: $actualHash');
      }
      
      debugPrint('SyncService: Download complete & Integrity verified.');

      // 5. Parse JSON
      final jsonString = utf8.decode(bytes);
      final List<dynamic> jsonList = jsonDecode(jsonString);

      final List<LocalIngredient> ingredients = jsonList.map((item) {
        final map = item as Map<String, dynamic>;
        return LocalIngredient()
          ..firestoreId = map['id'] ?? ''
          ..name = map['name'] ?? ''
          ..aliases = List<String>.from(map['aliases'] ?? [])
          ..searchTokens = List<String>.from(map['searchTokens'] ?? [])
          ..scientificName = map['scientificName']
          ..eNumber = map['eNumber']
          ..status = map['status'] ?? 'unknown'
          ..category = map['category'] ?? 'uncategorized'
          ..origin = map['origin'] ?? 'unknown'
          ..animalDerived = map['animalDerived'] ?? false
          ..plantDerived = map['plantDerived'] ?? false
          ..synthetic = map['synthetic'] ?? false
          ..riskLevel = map['riskLevel'] ?? 'low'
          ..explanation = map['explanation'] ?? ''
          ..scholarlyNotes = map['scholarlyNotes']
          ..languageVariants = map['languageVariants'] != null ? List<String>.from(map['languageVariants']) : null
          ..possibleSources = map['possibleSources'] != null ? List<String>.from(map['possibleSources']) : null
          ..references = map['references'] != null ? List<String>.from(map['references']) : null
          ..createdAt = DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now()
          ..updatedAt = DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now()
          ..verifiedBy = map['verifiedBy'] ?? 'system';
      }).toList();

      // 6. Bulk Insert into Isar
      await _isar.writeTxn(() async {
        // Clear old data to prevent stale ingredients
        await _isar.localIngredients.clear();
        
        // Insert new data
        await _isar.localIngredients.putAll(ingredients);
        
        // Update Metadata
        final newMetadata = AppMetadata()
          ..id = 0
          ..currentDatabaseVersion = remoteVersion
          ..lastSyncTime = DateTime.now()
          ..lastSha256 = actualHash;
          
        await _isar.appMetadatas.put(newMetadata);
      });

      debugPrint('SyncService: Successfully synced ${ingredients.length} ingredients to Isar database.');

    } catch (e) {
      debugPrint('SyncService: Failed to sync database: $e');
      // On failure, the local DB remains untouched and safe to use.
    }
  }
}
