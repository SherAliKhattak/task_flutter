import 'package:flutter_assignment_upwork/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthSessionModel> login({
    required String username,
    required String password,
  });
}
