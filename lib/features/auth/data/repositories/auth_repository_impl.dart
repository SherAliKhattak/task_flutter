import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/core/network/result_guard.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remote,
    required AuthLocalDataSource local,
  }) : _remote = remote,
       _local = local;

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  Future<Result<User>> login({
    required String username,
    required String password,
  }) {
    return guardRequest(() async {
      final session = await _remote.login(
        username: username,
        password: password,
      );
      await _local.saveSession(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        user: session.user,
      );
      return session.user.toEntity();
    });
  }

  @override
  Future<User?> getCachedUser() async {
    try {
      final user = await _local.readUser();
      return user?.toEntity();
    } on Object {
      return null;
    }
  }

  @override
  Future<void> logout() => _local.clear();
}
