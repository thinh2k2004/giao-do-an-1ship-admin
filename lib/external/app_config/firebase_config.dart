import 'package:base_getx/external/services/notification/app_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseConfig {
  static Future<void> config() async {
    await Firebase.initializeApp();
    await _configRemoteConfig();
    await _notificationConfig();
  }

  static Future<void> _configRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 0),
    ));
    await remoteConfig.setDefaults(const {});
    await remoteConfig.fetchAndActivate();
  }

  static Future<void> _notificationConfig() async {
    await AppNotification().initNotification();
  }
}
