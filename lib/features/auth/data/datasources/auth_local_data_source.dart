import 'package:flutter_assignment_upwork/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveSession({
    required String accessToken,
    String? refreshToken,
    required UserModel user,
  });

  Future<String?> readAccessToken();

  Future<String?> readRefreshToken();

  Future<void> updateTokens({
    required String accessToken,
    String? refreshToken,
  });

  Future<UserModel?> readUser();

  Future<bool> hasSession();

  Future<void> clear();
}
