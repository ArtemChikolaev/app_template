/// Base class for all failures that can happen in the app.
sealed class Failure {
  const Failure(this.message);

  /// Localization key for the error (e.g. [ErrorKeys.network]).
  /// Use in UI as `failure.message.tr()` to show translated text.
  final String message;
}

/// Issues related to network connectivity, timeouts, DNS etc.
final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Server returned a non‑successful response (4xx, 5xx).
final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Any other unexpected error.
final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

