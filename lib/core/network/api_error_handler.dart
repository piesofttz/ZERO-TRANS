import 'package:dio/dio.dart';

import 'api_exceptions.dart';

class AppErrorHandler {
  AppErrorHandler._();

  static AppException resolve(Object error) {
    if (error is AppException) return error;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          return const NetworkException();
        default:
          return const ServerException();
      }
    }

    return const ServerException();
  }
}
