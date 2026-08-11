import 'package:dio/dio.dart';

import 'api_constant.dart';

/// Shared Dio instance, ready for the backend once it exists.
///
/// TODO(backend): nothing currently calls this — repositories return mock
/// data. Point a repository at `DioClient.dio` when its endpoint goes live.
class DioClient {
  DioClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
