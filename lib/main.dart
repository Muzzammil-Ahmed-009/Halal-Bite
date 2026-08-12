/*
 * Project: HalalBite Mobile Application
 * Developing by: 𝓜𝓾𝔃𝔃𝓪𝓶𝓶𝓲𝓵 𝓐𝓱𝓶𝓮𝓭
 * Status: UI/UX & Shell Integration
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'l10n/app_localizations.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'core/database/isar_database_service.dart';
import 'core/database/firebase_sync_service.dart';
import 'core/services/connectivity_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  try {
    await FirebaseAppCheck.instance.activate(
      // ignore: deprecated_member_use
      androidProvider: AndroidProvider.playIntegrity,
      // ignore: deprecated_member_use
      appleProvider: AppleProvider.deviceCheck,
    );
  } catch (e) {
    debugPrint('Firebase App Check initialization failed: $e');
  }
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // Initialize Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  
  try {
    await GoogleSignIn.instance.initialize();
  } catch (e) {
    debugPrint('Google Sign-In initialization failed: $e');
  }

  // Initialize Local Database
  await IsarDatabaseService.initialize();

  // Start Sync Process (Run in background)
  final syncService = FirebaseSyncService(FirebaseFirestore.instance, IsarDatabaseService.isar);
  syncService.syncDatabase(); // Don't await, let it run in background

  // Start Connectivity Monitoring
  ConnectivityService().startMonitoring();

  runApp(
    const ProviderScope(
      child: ClearBiteApp(),
    ),
  );
}

class ClearBiteApp extends ConsumerWidget {
  const ClearBiteApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

