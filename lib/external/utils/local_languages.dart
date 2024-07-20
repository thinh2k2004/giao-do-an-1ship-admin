import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/external/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalLanguages {
  static const defaultLocale =
      Locale(Constants.defaultLanguageCode, Constants.defaultCountryCode);
  static final authenticationRepository = Get.find<IAuthenticationRepository>();

  static Locale get locale {
    final languageCode = authenticationRepository.getLanguageCode();
    final countryCode = authenticationRepository.getCountryCode();
    return Locale(languageCode, countryCode);
  }

  static const localesSupported = [
    Locale('en', 'US'),
    Locale(Constants.defaultLanguageCode, Constants.defaultCountryCode),
  ];

  static const List locales = [
    {
      'name': 'English',
      'locale': Locale('en', 'US'),
    },
    {
      'name': 'Tiếng Việt',
      'locale':
          Locale(Constants.defaultLanguageCode, Constants.defaultCountryCode),
    },
  ];

  static Future<void> setLanguage(Locale locale) async {
    if (Get.locale?.languageCode != locale.languageCode) {
      await Future.wait([
        authenticationRepository.saveLanguageCode(locale.languageCode),
        authenticationRepository.saveCountryCode(locale.countryCode),
      ]);
      Get.updateLocale(locale);
    }
  }
}
