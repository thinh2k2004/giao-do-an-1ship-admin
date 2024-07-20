abstract class IAuthenticationRepository {
  Future<void> saveToken(String token);

  Future<String> getToken();

  Future<void> clearSecureStorage();

  Future<void> saveFirebaseToken(String token);

  String getFirebaseToken();

  Future<void> saveLanguageCode(String value);

  String getLanguageCode();

  Future<void> saveCountryCode(String? value);

  String getCountryCode();

  Future<void> clearSharedPreferences();
}
