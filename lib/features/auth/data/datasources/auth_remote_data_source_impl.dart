import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/core/constants/api_constants.dart';
import 'package:flutter_assignment_upwork/core/network/json_utils.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<AuthSessionModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post<dynamic>(
      ApiConstants.login,
      data: {'username': username, 'password': password},
    );
    return AuthSessionModel.fromJson(requireJsonMap(response.data));
  }
}
