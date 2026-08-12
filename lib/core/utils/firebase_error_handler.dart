import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class FirebaseErrorHandler {
  static String getFriendlyMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'admin-restricted-operation':
        case 'operation-not-allowed':
          return 'Guest login is temporarily unavailable. Please use email or Google.';
        case 'user-not-found':
          return 'No account found with this email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'email-already-in-use':
          return 'An account already exists with this email.';
        case 'weak-password':
          return 'Password is too weak. Please use a stronger password.';
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'user-disabled':
          return 'This account has been disabled. Please contact support.';
        case 'invalid-credential':
          return 'Invalid credentials. Please try again.';
        default:
          return 'Authentication failed. Please try again.';
      }
    } else if (error is PlatformException) {
      if (error.code == 'firebase_storage' || (error.message?.contains('unauthenticated') ?? false)) {
        return 'Session expired. Please log out and log in again to upload images.';
      }
      if (error.code == 'cloud_firestore' || (error.message?.contains('permission-denied') ?? false)) {
        return 'You do not have permission to access this data. Please log out and log in again.';
      }
      return 'An unexpected error occurred. Please try again.';
    } else {
      final strError = error.toString().toLowerCase();
      if (strError.contains('unauthenticated') || strError.contains('unauthorized')) {
        return 'Session expired. Please log out and log in again.';
      }
      if (strError.contains('permission-denied') || strError.contains('permission_denied')) {
        return 'Database access denied. Please log out and log in again.';
      }
      return 'An unexpected error occurred. Please check your internet connection.';
    }
  }
}
