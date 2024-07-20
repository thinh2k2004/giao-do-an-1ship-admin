import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/domain/utils/app_log.dart';
import 'package:base_getx/presenters/extension/request_options_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'exceptions/server_exception.dart';

class AppInterceptors extends InterceptorsWrapper {
  final IAuthenticationRepository _authenticationRepository;

  AppInterceptors(this._authenticationRepository);

  @override
  Future<RequestOptions> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String token = await _authenticationRepository.getToken();
    final headers = <String, dynamic>{};
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    // headers["platform"] = ApiConfig.platform;
    // headers["appVersion"] = ApiConfig.appVersion;
    options.headers.addAll(headers);

    if (kDebugMode) {
      /// Log CURL
      AppLog.info('>>>>>>>>CURL:\n${options.toCURL()}');
    }

    super.onRequest(options, handler);
    return options;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ServerExceptionError.withError(error: (err));
    super.onError(err, handler);
  }

  Future<Response> retryToken(Response response) async {
    return response;
  }
}
