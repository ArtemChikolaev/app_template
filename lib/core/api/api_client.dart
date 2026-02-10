import 'package:dio/dio.dart';

import 'package:app_template/core/logger/app_logger.dart';

/// Simple wrapper around [Dio] that centralises
/// base URL, timeouts and interceptors.
class ApiClient {
  ApiClient({required String baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.debug('API ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.debug(
            'API ${response.statusCode} ${response.requestOptions.uri}',
          );
          handler.next(response);
        },
        onError: (error, handler) {
          AppLogger.error(
            'API error ${error.requestOptions.uri}',
            error,
            error.stackTrace,
          );
          handler.next(error);
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
