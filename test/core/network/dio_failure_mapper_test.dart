import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/network/dio_failure_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps connection errors to a network failure', () {
    final failure = mapDioException(
      DioException(
        requestOptions: RequestOptions(path: '/products'),
        type: DioExceptionType.connectionError,
      ),
    );

    expect(failure, isA<NetworkFailure>());
  });

  test('uses the message returned by DummyJSON', () {
    final failure = mapDioException(
      DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          statusCode: 400,
          data: {'message': 'Invalid credentials'},
        ),
      ),
    );

    expect(failure.message, 'Invalid credentials');
  });
}
