/// A recoverable failure that crossed the domain boundary.
sealed class Failure {
  const Failure(this.message);

  final String message;
}

/// The device could not reach the server.
final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Check your connection and try again.',
  ]);
}

/// The server responded with an error or an unexpected payload.
final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
