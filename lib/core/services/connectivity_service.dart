import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A lightweight connectivity service that checks real internet availability.
/// Does NOT require any extra package — uses a simple DNS lookup.
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._();
  ConnectivityService._();
  factory ConnectivityService() => _instance;

  final _connectivityController = StreamController<bool>.broadcast();
  Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  Timer? _pollingTimer;

  /// Start periodic connectivity checks (every 5 seconds)
  void startMonitoring() {
    _checkConnectivity(); // Initial check
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _checkConnectivity();
    });
  }

  void stopMonitoring() {
    _pollingTimer?.cancel();
  }

  Future<void> _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      final hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      _updateStatus(hasConnection);
    } on SocketException catch (_) {
      _updateStatus(false);
    } on TimeoutException catch (_) {
      _updateStatus(false);
    } catch (_) {
      _updateStatus(false);
    }
  }

  void _updateStatus(bool isOnline) {
    if (_isOnline != isOnline) {
      _isOnline = isOnline;
      _connectivityController.add(isOnline);
      debugPrint('ConnectivityService: ${isOnline ? "ONLINE ✅" : "OFFLINE ❌"}');
    }
  }

  void dispose() {
    _pollingTimer?.cancel();
    _connectivityController.close();
  }
}

/// Provider for connectivity status stream
final connectivityStreamProvider = StreamProvider<bool>((ref) {
  final service = ConnectivityService();
  service.startMonitoring();
  ref.onDispose(() => service.stopMonitoring());
  return service.onConnectivityChanged;
});

/// Provider for current connectivity status
final isOnlineProvider = Provider<bool>((ref) {
  final asyncValue = ref.watch(connectivityStreamProvider);
  return asyncValue.when(
    data: (isOnline) => isOnline,
    loading: () => true, // Assume online until first check
    error: (_, __) => false,
  );
});
