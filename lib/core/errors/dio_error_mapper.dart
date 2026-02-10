import 'package:dio/dio.dart';

import 'package:app_template/core/errors/failure.dart';

/// Localization keys for error messages (must exist in assets/translations).
abstract final class ErrorKeys {
  static const network = 'errors_network';
  static const server = 'errors_server';
  static const client = 'errors_client';
  static const timeout = 'errors_timeout';
  static const cancelled = 'errors_cancelled';
  static const unknown = 'errors_unknown';
}

/// Maps [DioException] to a [Failure] with a localization key as [Failure.message].
/// Use in repositories instead of duplicating mapping logic.
Failure mapDioException(DioException e) {
  final DioExceptionType type = e.type;
  final int? statusCode = e.response?.statusCode;

  // Timeouts
  if (type == DioExceptionType.connectionTimeout ||
      type == DioExceptionType.sendTimeout ||
      type == DioExceptionType.receiveTimeout) {
    return const NetworkFailure(ErrorKeys.timeout);
  }

  // User cancelled
  if (type == DioExceptionType.cancel) {
    return const NetworkFailure(ErrorKeys.cancelled);
  }

  // Bad certificate, connection error, unknown (e.g. no internet)
  if (type == DioExceptionType.badCertificate ||
      type == DioExceptionType.connectionError ||
      type == DioExceptionType.unknown) {
    return const NetworkFailure(ErrorKeys.network);
  }

  // Response with status code
  if (statusCode != null) {
    if (statusCode >= 500 && statusCode < 600) {
      return const ServerFailure(ErrorKeys.server);
    }
    if (statusCode >= 400 && statusCode < 500) {
      return const ServerFailure(ErrorKeys.client);
    }
  }

  // Fallback
  return const NetworkFailure(ErrorKeys.network);
}
