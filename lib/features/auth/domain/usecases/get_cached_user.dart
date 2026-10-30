import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';

class GetCachedUser {
  const GetCachedUser(this._repository);

  final AuthRepository _repository;

  Future<User?> call() => _repository.getCachedUser();
}
