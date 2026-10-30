import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/core/constants/api_constants.dart';
import 'package:flutter_assignment_upwork/core/network/auth_interceptor.dart';
import 'package:flutter_assignment_upwork/core/network/json_utils.dart';

Dio createDio({
  required TokenReader readAccessToken,
  required TokenReader readRefreshToken,
  required TokenWriter persistTokens,
  required SessionExpired onSessionExpired,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      sendTimeout: ApiConstants.connectTimeout,
      responseType: ResponseType.json,
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  final refreshDio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      dio: dio,
      readAccessToken: readAccessToken,
      readRefreshToken: readRefreshToken,
      persistTokens: persistTokens,
      refresh: (refreshToken) => _refreshSession(refreshDio, refreshToken),
      onSessionExpired: onSessionExpired,
    ),
  );

  return dio;
}

Future<RefreshedSession?> _refreshSession(
  Dio refreshDio,
  String refreshToken,
) async {
  final response = await refreshDio.post<dynamic>(
    ApiConstants.refresh,
    data: {'refreshToken': refreshToken, 'expiresInMins': 30},
  );
  final json = requireJsonMap(response.data);
  final accessToken = json['accessToken'];
  if (accessToken is! String || accessToken.isEmpty) return null;
  final nextRefresh = json['refreshToken'];
  return RefreshedSession(
    accessToken: accessToken,
    refreshToken: nextRefresh is String && nextRefresh.isNotEmpty
        ? nextRefresh
        : null,
  );
}
