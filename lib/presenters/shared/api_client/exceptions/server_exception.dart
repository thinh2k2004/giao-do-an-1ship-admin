import 'package:base_getx/domain/utils/app_log.dart';
import 'package:base_getx/presenters/shared/events/system_event.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ServerExceptionError implements Exception {
  String _errorMessage = '';

  ServerExceptionError.withError({required DioException error}) {
    _handleError(error);
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = 'request_was_cancelled'.tr;
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = 'connection_timeout'.tr;
        break;
      case DioExceptionType.unknown:
        _errorMessage = 'internet_failed'.tr;
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = 'receive_timeout'.tr;
        break;
      case DioExceptionType.badResponse:
        _errorMessage =
            "${'invalid_status_code'.tr}: ${error.response?.statusCode ?? ""}";
        if (error.response?.statusCode == 401) {
          _errorMessage = error.response!.data['Message'] ?? 'Token expired!';
          SystemEvent.addEvent(SystemEventType.FORCE_LOGOUT);
        }
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = 'send_timeout'.tr;
        break;
      default:
        break;
    }
    AppLog.error('DioError: $_errorMessage');
    return _errorMessage;
  }
}
