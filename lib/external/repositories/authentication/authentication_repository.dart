import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/external/constants/constants.dart';
import 'package:base_getx/presenters/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _preferences;

  const AuthenticationRepository(this._secureStorage, this._preferences);

  // FlutterSecureStorage

  @override
  Future<String> getToken() {
    return _secureStorage
        .read(key: PrefKeys.TOKEN)
        .then((value) => value ?? '');
  }

  @override
  Future<void> saveToken(String token) {
    return _secureStorage.write(key: PrefKeys.TOKEN, value: token);
  }

  @override
  Future<void> clearSecureStorage() {
    return _secureStorage.deleteAll();
  }

  //------------------------------------------
  // SharedPreferences

  @override
  String getFirebaseToken() {
    return _preferences.getString(PrefKeys.FIREBASE_TOKEN) ?? '';
  }

  @override
  Future<void> saveFirebaseToken(String token) {
    return _preferences.setString(PrefKeys.FIREBASE_TOKEN, token);
  }

  @override
  String getLanguageCode() {
    return _preferences.getString(PrefKeys.LANGUAGE_CODE) ??
        Constants.defaultLanguageCode;
  }

  @override
  Future<void> saveLanguageCode(String value) {
    return _preferences.setString(PrefKeys.LANGUAGE_CODE, value);
  }

  @override
  String getCountryCode() {
    return _preferences.getString(PrefKeys.COUNTRY_CODE) ??
        Constants.defaultCountryCode;
  }

  @override
  Future<void> saveCountryCode(String? value) {
    return _preferences.setString(
        PrefKeys.COUNTRY_CODE, value ?? Constants.defaultCountryCode);
  }

  @override
  Future<void> clearSharedPreferences() {
    return _preferences.clear();
  }
}
