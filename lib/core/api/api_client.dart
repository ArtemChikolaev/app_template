import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:app_template/core/logger/app_logger.dart';

/// Centralised HTTP client. Use for all API calls.
///
/// - Pass [dio] to use an existing instance (e.g. in tests or custom config).
/// - Pass [baseHeaders] to set default headers (e.g. Accept, or auth via interceptor).
/// - In release, request/response bodies are not logged to avoid leaking tokens/PII.
class ApiClient {
  ApiClient({
    required String baseUrl,
    Dio? dio,
    Map<String, dynamic>? baseHeaders,
  }) : _dio = dio ?? _createDio(baseUrl, baseHeaders) {
    if (dio == null) {
      _dio.interceptors.add(_loggingInterceptor());
      if (kDebugMode) {
        _dio.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true),
        );
      }
    }
  }

  static Dio _createDio(String baseUrl, Map<String, dynamic>? baseHeaders) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: baseHeaders,
      ),
    );
  }

  static InterceptorsWrapper _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          AppLogger.debug('API ${options.method} ${options.uri}');
        } else {
          AppLogger.debug('API ${options.method} ${options.uri.path}');
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          AppLogger.debug(
            'API ${response.statusCode} ${response.requestOptions.uri}',
          );
        } else {
          AppLogger.debug(
            'API ${response.statusCode} ${response.requestOptions.uri.path}',
          );
        }
        handler.next(response);
      },
      onError: (error, handler) {
        AppLogger.error(
          'API error ${error.requestOptions.method} ${error.requestOptions.uri.path}',
          error,
          error.stackTrace,
        );
        handler.next(error);
      },
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

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
