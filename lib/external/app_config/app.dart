import 'package:base_getx/external/bindings/app/app_binding.dart';
import 'package:base_getx/external/custom_view/floating_debug_button.dart';
import 'package:base_getx/external/utils/app_utils.dart';
import 'package:base_getx/external/utils/local_languages.dart';
import 'package:base_getx/presenters/generated/locales.g.dart';
import 'package:base_getx/presenters/shared/events/system_event.dart';
import 'package:base_getx/presenters/shared/logger/logger_utils.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../routes/app_pages.dart';

class MyApp extends StatefulWidget {
  final bool shouldShowDebugButton;

  const MyApp({
    required this.shouldShowDebugButton,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemEvent.systemEventStream.listen((event) {
      switch (event) {
        case SystemEventType.LOGIN:
          break;
        case SystemEventType.LOGOUT:
          break;
        case SystemEventType.FORCE_LOGOUT:
          appLogOut();
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: GetMaterialApp(
        locale: LocalLanguages.locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalLanguages.localesSupported,
        fallbackLocale: LocalLanguages.defaultLocale,
        theme: ThemeData(
          // fontFamily:FontFamily.baiJamjuree,
          primaryColor: AppColors.mainColor,
          // scaffoldBackgroundColor: AppColors.whiteBGColor,
        ),
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        translationsKeys: AppTranslation.translations,
        enableLog: true,
        logWriterCallback: Logger.write,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        builder: (context, child) => Stack(
          children: [
            child ?? const SizedBox.shrink(),
            FloatingDebugButton(
              shouldShowDebugButton: widget.shouldShowDebugButton,
            ),
          ],
        ),
      ),
    );
  }
}
