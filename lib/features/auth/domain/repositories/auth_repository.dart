import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Result<User>> login({
    required String username,
    required String password,
  });

  Future<User?> getCachedUser();

  Future<void> logout();
}
