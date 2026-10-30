import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/core/network/dio_failure_mapper.dart';

/// Runs a data-layer call and converts transport failures into [Result].
Future<Result<T>> guardRequest<T>(Future<T> Function() run) async {
  try {
    return Success(await run());
  } on DioException catch (error) {
    return FailureResult(mapDioException(error));
  } on FormatException {
    return const FailureResult(
      ServerFailure('Unexpected response from the server.'),
    );
  } catch (_) {
    return const FailureResult(
      ServerFailure('Something went wrong. Please try again.'),
    );
  }
}
