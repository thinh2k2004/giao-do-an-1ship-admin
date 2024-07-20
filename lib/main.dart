import 'package:base_getx/domain/constants/flavor.dart';
import 'package:base_getx/external/app_config/app.dart';
import 'package:base_getx/external/app_config/app_config.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppConfig.appConfig();
  runApp(
    MyApp(shouldShowDebugButton: Flavor.flavorType.isDev),
  );
}
