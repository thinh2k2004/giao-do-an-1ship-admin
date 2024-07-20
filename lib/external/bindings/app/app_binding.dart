import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/external/repositories/authentication/authentication_repository.dart';
import 'package:base_getx/presenters/shared/api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initBindings() async {
  const secureStorage = FlutterSecureStorage();
  final sharedPreference = await SharedPreferences.getInstance();
  Get
    ..put<FlutterSecureStorage>(secureStorage)
    ..put<SharedPreferences>(sharedPreference)
    ..put<IAuthenticationRepository>(
      AuthenticationRepository(
        Get.find<FlutterSecureStorage>(),
        Get.find<SharedPreferences>(),
      ),
    );
}

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<ApiClient>(ApiClient(Dio(), Get.find<IAuthenticationRepository>()));
  }
}
