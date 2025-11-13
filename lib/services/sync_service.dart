import 'dart:async';
import 'package:flutter/foundation.dart';
import 'shared_json_service.dart';

class SyncService extends ChangeNotifier {
  static SyncService? _instance;
  static SyncService get instance {
    _instance ??= SyncService._();
    return _instance!;
  }

  SyncService._();

  Timer? _syncTimer;
  bool _isSyncing = false;
  DateTime? _lastSyncTime;

  bool get isSyncing => _isSyncing;
  DateTime? get lastSyncTime => _lastSyncTime;

  void startAutoSync({Duration interval = const Duration(seconds: 3)}) {
    stopAutoSync();
    _syncTimer = Timer.periodic(interval, (_) => sync());
  }

  void stopAutoSync() {
    _syncTimer?.cancel();
    _syncTimer = null;
  }

  Future<void> sync() async {
    if (_isSyncing) return;
    
    _isSyncing = true;
    notifyListeners();
    
    try {
      await SharedJsonService.instance.refresh();
      _lastSyncTime = DateTime.now();
    } catch (e) {
      if (kDebugMode) {
        print('Erreur sync: $e');
      }
    } finally {
      _isSyncing = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    stopAutoSync();
    super.dispose();
  }
}

