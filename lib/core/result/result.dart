import 'package:app_template/core/errors/failure.dart';

/// Simple result type that carries either a value [T] or a [Failure].
class Result<T> {
  const Result._({this.data, this.failure});

  /// Successful result.
  const Result.success(T value) : this._(data: value);

  /// Failed result.
  const Result.failure(Failure failure) : this._(failure: failure);

  final T? data;
  final Failure? failure;

  bool get isSuccess => failure == null;
  bool get isFailure => failure != null;

  /// Maps success to [onSuccess] value or failure to [onFailure] value.
  R fold<R>(R Function(T data) onSuccess, R Function(Failure failure) onFailure) {
    if (failure != null) return onFailure(failure!);
    return onSuccess(data as T);
  }
}
