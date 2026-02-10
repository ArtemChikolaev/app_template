import 'dart:convert';

import 'package:app_template/core/api/api_client.dart';
import 'package:app_template/core/errors/failure.dart';
import 'package:app_template/core/logger/app_logger.dart';
import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';
import 'package:app_template/src/features/home/domain/repository/home_repository.dart';
import 'package:dio/dio.dart';

/// Example implementation of [HomeRepository] that loads data
/// from a mock HTTP endpoint using [ApiClient].
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<HomeEntity>> getHomeData() async {
    AppLogger.debug('HomeRepositoryImpl.getHomeData started');

    try {
      // Example: fetch a fake post from dummyjson
      final response = await _apiClient.get<dynamic>('/posts/1');

      final Map<String, dynamic> data = switch (response.data) {
        final Map<String, dynamic> map => map,
        final String body => jsonDecode(body) as Map<String, dynamic>,
        _ => <String, dynamic>{},
      };

      final entity = HomeEntity(
        title: data['title']?.toString() ?? 'Home from network',
        description:
            data['body']?.toString() ?? 'This text comes from a mock API call.',
      );

      AppLogger.info('HomeRepositoryImpl.getHomeData success');
      return Result<HomeEntity>.success(entity);
    } on DioException catch (error) {
      final int? statusCode = error.response?.statusCode;
      final String failureMessage;

      if (statusCode != null && statusCode >= 500 && statusCode < 600) {
        failureMessage =
            'Server is currently unavailable. Please try again later.';
      } else if (statusCode != null && statusCode >= 400 && statusCode < 500) {
        failureMessage =
            'Request cannot be completed. Please check your input or try again.';
      } else {
        failureMessage =
            'Network error occurred. Please check your connection.';
      }

      final Failure failure = statusCode == null
          ? NetworkFailure(failureMessage)
          : ServerFailure('$failureMessage (code: $statusCode)');

      AppLogger.warning(
        'HomeRepositoryImpl.getHomeData failed: ${failure.message}',
        error,
      );
      return Result<HomeEntity>.failure(failure);
    } catch (error, stackTrace) {
      AppLogger.error(
        'HomeRepositoryImpl.getHomeData unexpected error',
        error,
        stackTrace,
      );
      return Result<HomeEntity>.failure(
        const UnknownFailure('Unexpected error occurred. Please try again.'),
      );
    }
  }
}
