import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/services/analytics_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider), ref.watch(analyticsServiceProvider));
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

class AuthRepository {
  final FirebaseAuth _auth;
  final AnalyticsService _analytics;

  AuthRepository(this._auth, this._analytics);

  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    await _analytics.logUserSignedIn(method: 'email');
  }

  Future<void> signUp(String email, String password, {String? displayName}) async {
    UserCredential userCredential;
    
    if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
      // Link the anonymous account to the new email/password credentials
      final credential = EmailAuthProvider.credential(email: email, password: password);
      userCredential = await _auth.currentUser!.linkWithCredential(credential);
      await _analytics.logGuestConverted();
    } else {
      // Normal sign up
      userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _analytics.logUserSignedUp(method: 'email');
    }

    if (displayName != null && displayName.trim().isNotEmpty) {
      await userCredential.user?.updateDisplayName(displayName.trim());
      // Reload user so the new display name is reflected immediately
      await userCredential.user?.reload();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser;
    try {
      googleUser = await GoogleSignIn.instance.authenticate();
    } catch (e) {
      // The user canceled the sign-in or there was an error
      return false;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
      await _auth.currentUser!.linkWithCredential(credential);
      await _analytics.logGuestConverted();
    } else {
      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(credential);
      await _analytics.logUserSignedIn(method: 'google');
    }
    return true;
  }
}
