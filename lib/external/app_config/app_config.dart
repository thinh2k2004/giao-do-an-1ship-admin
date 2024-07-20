import 'package:base_getx/external/app_config/firebase_config.dart';
import 'package:base_getx/domain/constants/flavor.dart';
import 'package:base_getx/external/bindings/app/app_binding.dart';
import 'package:base_getx/domain/utils/app_log.dart';
import 'package:flavor_getter/flavor_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// --dart-define=flavor=dev
// const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');

class AppConfig {
  static Future<void> appConfig() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initBindings();
    // imageCache
    // PaintingBinding.instance.imageCache.maximumSizeBytes =
    //     300 * 1024 * 1024; // 300 MB

    // Flavor
    final flavor = await FlavorGetter().getFlavor() ?? 'dev';
    await dotenv.load(fileName: _envConfig(flavor));

    await FirebaseConfig.config();
    await _initOrientations();
  }

  static String _envConfig(String flavor) {
    switch (flavor) {
      case 'dev':
        Flavor.setFlavor(FlavorType.dev);
        AppLog.needShowLog = true;
        AppLog.info('Running in Development Mode');
        return '.env.dev';
      case 'prod':
        Flavor.setFlavor(FlavorType.prod);
        AppLog.needShowLog = false;
        AppLog.info('Running in Production Mode');
        return '.env.prod';
      default:
        Flavor.setFlavor(FlavorType.dev);
        AppLog.needShowLog = true;
        AppLog.info('Running in Development Mode');
        return '.env.dev';
    }
  }

  static Future<void> _initOrientations() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
}
