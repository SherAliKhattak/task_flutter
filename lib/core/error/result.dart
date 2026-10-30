import 'package:flutter_assignment_upwork/core/error/failure.dart';

/// The outcome of a use case that can fail without throwing.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

final class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  final Failure failure;
}
