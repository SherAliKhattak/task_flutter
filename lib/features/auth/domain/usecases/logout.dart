import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';

class Logout {
  const Logout(this._repository);

  final AuthRepository _repository;

  Future<void> call() => _repository.logout();
}
