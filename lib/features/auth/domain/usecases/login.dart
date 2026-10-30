import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';

class Login {
  const Login(this._repository);

  final AuthRepository _repository;

  Future<Result<User>> call({
    required String username,
    required String password,
  }) {
    return _repository.login(username: username, password: password);
  }
}
