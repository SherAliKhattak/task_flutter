import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/data/models/user_model.dart';
import 'package:flutter_assignment_upwork/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fakes.dart';

void main() {
  test('stores the access token and returns the user', () async {
    final remote = FakeAuthRemote()
      ..session = const AuthSessionModel(
        accessToken: 'access-token',
        refreshToken: 'refresh-token',
        user: UserModel(
          id: 1,
          username: 'emilys',
          email: 'emily.johnson@x.dummyjson.com',
          firstName: 'Emily',
          lastName: 'Johnson',
        ),
      );
    final local = FakeAuthLocal();
    final repository = AuthRepositoryImpl(remote: remote, local: local);

    final result = await repository.login(
      username: 'emilys',
      password: 'emilyspass',
    );

    expect(result, isA<Success<User>>());
    expect((result as Success<User>).data.displayName, 'Emily Johnson');
    expect(local.accessToken, 'access-token');
    expect(local.refreshToken, 'refresh-token');
    expect(local.user?.username, 'emilys');
  });

  test('maps an invalid-credentials response', () async {
    final remote = FakeAuthRemote()
      ..error = DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          statusCode: 400,
          data: {'message': 'Invalid credentials'},
        ),
      );
    final repository = AuthRepositoryImpl(
      remote: remote,
      local: FakeAuthLocal(),
    );

    final result = await repository.login(username: 'emilys', password: 'nope');

    expect(result, isA<FailureResult<User>>());
    expect(
      (result as FailureResult<User>).failure,
      isA<ServerFailure>().having(
        (failure) => failure.message,
        'message',
        'Invalid credentials',
      ),
    );
  });

  test('logout clears the stored session', () async {
    final local = FakeAuthLocal()..accessToken = 'access-token';
    final repository = AuthRepositoryImpl(
      remote: FakeAuthRemote(),
      local: local,
    );

    await repository.logout();

    expect(local.clearCount, 1);
    expect(local.accessToken, isNull);
  });
}
