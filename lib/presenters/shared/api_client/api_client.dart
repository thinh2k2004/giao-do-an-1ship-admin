import 'package:base_getx/domain/constants/flavor.dart';
import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/domain/utils/app_log.dart';
import 'package:base_getx/presenters/constants/constants.dart';
import 'package:base_getx/presenters/shared/api_client/api_mock_adapter.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app_intercepter.dart';

class ApiClient {
  final Dio dio;
  final IAuthenticationRepository authenticationRepository;

  ApiClient(this.dio, this.authenticationRepository) {
    dio.options.baseUrl = dotenv.get(EnvKeys.BASE_URL);
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);

    // if (kDebugMode) {
    //   dio.interceptors.add(
    //     PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseHeader: true,
    //       responseBody: true,
    //       error: true,
    //       canShowLog: kDebugMode,
    //     ),
    //   );
    // }
    dio.interceptors.add(AppInterceptors(authenticationRepository));
    if (AppLog.needShowLog) {
      dio.interceptors.add(ChuckerDioInterceptor());
    }
    if (Flavor.flavorType.isDev) {
      dio.httpClientAdapter = APIMockingAdapter();
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(path, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? param}) async {
    return await dio.delete(path, queryParameters: param);
  }

  Future<Response> get(String path, {Map<String, dynamic>? param}) async {
    return await dio.get(path, queryParameters: param);
  }
}
