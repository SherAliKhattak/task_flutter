import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';

Failure mapDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
    case DioExceptionType.connectionError:
      return const NetworkFailure();
    case DioExceptionType.badCertificate:
      return const NetworkFailure('Secure connection failed.');
    case DioExceptionType.cancel:
      return const ServerFailure('The request was cancelled.');
    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      final message = _messageFromResponse(exception);
      if (exception.error is FormatException) {
        return const ServerFailure('Unexpected response from the server.');
      }
      return ServerFailure(
        message ?? 'Something went wrong. Please try again.',
      );
  }
}

String? _messageFromResponse(DioException exception) {
  final data = exception.response?.data;
  if (data is Map && data['message'] is String) {
    final message = (data['message'] as String).trim();
    if (message.isNotEmpty) return message;
  }
  return null;
}
