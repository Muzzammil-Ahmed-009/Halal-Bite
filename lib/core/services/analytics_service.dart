import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService(FirebaseAnalytics.instance);
});

class AnalyticsService {
  final FirebaseAnalytics _analytics;

  AnalyticsService(this._analytics);

  Future<void> logScanCompleted({required String result, required String source}) async {
    await _analytics.logEvent(
      name: 'scan_completed',
      parameters: {
        'result': result, // e.g., 'halal', 'haram', 'doubtful'
        'source': source, // e.g., 'ocr', 'barcode'
      },
    );
  }

  Future<void> logMistakeReported({required String reportType, required String ingredientId}) async {
    await _analytics.logEvent(
      name: 'mistake_reported',
      parameters: {
        'report_type': reportType,
        'ingredient_id': ingredientId,
      },
    );
  }

  Future<void> logSearchPerformed({required String query}) async {
    await _analytics.logEvent(
      name: 'search_performed',
      parameters: {
        'search_term': query,
      },
    );
  }

  Future<void> logGuestConverted() async {
    await _analytics.logEvent(name: 'guest_converted');
  }

  Future<void> logOnboardingCompleted() async {
    await _analytics.logTutorialComplete();
  }

  Future<void> logUserSignedIn({required String method}) async {
    await _analytics.logLogin(loginMethod: method);
  }

  Future<void> logUserSignedUp({required String method}) async {
    await _analytics.logSignUp(signUpMethod: method);
  }
}
