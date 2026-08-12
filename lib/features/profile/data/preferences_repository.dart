import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PreferencesRepository(FirebaseFirestore.instance, FirebaseAuth.instance);
});

// We use a StateNotifier to keep the UI in sync when preferences change
final preferencesProvider = StateNotifierProvider<PreferencesNotifier, UserPreferences>((ref) {
  final repository = ref.watch(preferencesRepositoryProvider);
  return PreferencesNotifier(repository);
});

class UserPreferences {
  final bool strictHalal;
  final bool lactoseIntolerant;
  final bool nutAllergy;
  final bool veganMode;

  UserPreferences({
    this.strictHalal = true, // Default to strict
    this.lactoseIntolerant = false,
    this.nutAllergy = false,
    this.veganMode = false,
  });

  UserPreferences copyWith({
    bool? strictHalal,
    bool? lactoseIntolerant,
    bool? nutAllergy,
    bool? veganMode,
  }) {
    return UserPreferences(
      strictHalal: strictHalal ?? this.strictHalal,
      lactoseIntolerant: lactoseIntolerant ?? this.lactoseIntolerant,
      nutAllergy: nutAllergy ?? this.nutAllergy,
      veganMode: veganMode ?? this.veganMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strictHalal': strictHalal,
      'lactoseIntolerant': lactoseIntolerant,
      'nutAllergy': nutAllergy,
      'veganMode': veganMode,
    };
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      strictHalal: map['strictHalal'] ?? true,
      lactoseIntolerant: map['lactoseIntolerant'] ?? false,
      nutAllergy: map['nutAllergy'] ?? false,
      veganMode: map['veganMode'] ?? false,
    );
  }
}

class PreferencesRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  PreferencesRepository(this._firestore, this._auth);

  DocumentReference? get _prefsDoc {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;
    return _firestore.collection('users').doc(uid).collection('settings').doc('preferences');
  }

  Future<UserPreferences> loadPreferences() async {
    try {
      final doc = await _prefsDoc?.get();
      if (doc != null && doc.exists) {
        return UserPreferences.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error loading preferences from Firestore: $e');
    }
    return UserPreferences(); // Return default if not found or error
  }

  Future<void> savePreferences(UserPreferences prefs) async {
    try {
      await _prefsDoc?.set(prefs.toMap(), SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving preferences to Firestore: $e');
    }
  }
}

class PreferencesNotifier extends StateNotifier<UserPreferences> {
  final PreferencesRepository _repository;

  PreferencesNotifier(this._repository) : super(UserPreferences()) {
    _loadFromFirestore();
  }

  Future<void> _loadFromFirestore() async {
    final prefs = await _repository.loadPreferences();
    if (mounted) {
      state = prefs;
    }
  }

  Future<void> updateStrictHalal(bool value) async {
    state = state.copyWith(strictHalal: value);
    await _repository.savePreferences(state);
  }

  Future<void> updateLactoseIntolerant(bool value) async {
    state = state.copyWith(lactoseIntolerant: value);
    await _repository.savePreferences(state);
  }

  Future<void> updateNutAllergy(bool value) async {
    state = state.copyWith(nutAllergy: value);
    await _repository.savePreferences(state);
  }

  Future<void> updateVeganMode(bool value) async {
    state = state.copyWith(veganMode: value);
    await _repository.savePreferences(state);
  }
}
