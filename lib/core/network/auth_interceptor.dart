import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/constants/api_constants.dart';

class RefreshedSession {
  const RefreshedSession({required this.accessToken, this.refreshToken});

  final String accessToken;
  final String? refreshToken;
}

typedef TokenReader = Future<String?> Function();
typedef TokenWriter =
    Future<void> Function(String accessToken, String? refreshToken);
typedef TokenRefresher =
    Future<RefreshedSession?> Function(String refreshToken);
typedef SessionExpired = Future<void> Function();

/// On a 401 from a signed-in session, exchanges the saved refresh token and
/// retries the original request once.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.dio,
    required this.readAccessToken,
    required this.readRefreshToken,
    required this.persistTokens,
    required this.refresh,
    required this.onSessionExpired,
  });

  final Dio dio;
  final TokenReader readAccessToken;
  final TokenReader readRefreshToken;
  final TokenWriter persistTokens;
  final TokenRefresher refresh;
  final SessionExpired onSessionExpired;

  Future<_RefreshOutcome>? _refreshing;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _attachToken(options, handler);
  }

  Future<void> _attachToken(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra['skipAuth'] == true) {
      handler.next(options);
      return;
    }
    final token = await _read(readAccessToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _handleError(err, handler);
  }

  Future<void> _handleError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.extra['retried'] == true) {
      await _expireQuietly();
      handler.next(err);
      return;
    }

    if (!_shouldRefresh(err)) {
      handler.next(err);
      return;
    }

    // Claim the refresh before any await so overlapping 401s share one call.
    final leader = _refreshing == null;
    final flight = _refreshing ??= _leadRefresh();

    try {
      final outcome = await flight;
      if (!outcome.signedIn || outcome.tokens == null) {
        if (leader && outcome.giveUp) await _expireQuietly();
        handler.next(err);
        return;
      }

      final request = err.requestOptions;
      request.extra['retried'] = true;
      request.headers['Authorization'] =
          'Bearer ${outcome.tokens!.accessToken}';
      final response = await dio.fetch<dynamic>(request);
      handler.resolve(response);
    } on DioException catch (error) {
      if (leader && error.response?.statusCode == 401) {
        await _expireQuietly();
      }
      handler.next(err);
    } on Object {
      if (leader) await _expireQuietly();
      handler.next(err);
    }
  }

  Future<_RefreshOutcome> _leadRefresh() {
    late final Future<_RefreshOutcome> flight;
    flight = _refreshSession().whenComplete(() {
      if (identical(_refreshing, flight)) _refreshing = null;
    });
    return flight;
  }

  Future<_RefreshOutcome> _refreshSession() async {
    final access = await _read(readAccessToken);
    final refreshToken = await _read(readRefreshToken);
    final signedIn = access != null && access.isNotEmpty;
    if (!signedIn) return const _RefreshOutcome.skipped();
    if (refreshToken == null || refreshToken.isEmpty) {
      return const _RefreshOutcome.giveUp();
    }

    try {
      final tokens = await refresh(refreshToken);
      if (tokens == null || tokens.accessToken.isEmpty) {
        return const _RefreshOutcome.giveUp();
      }
      await persistTokens(
        tokens.accessToken,
        tokens.refreshToken ?? refreshToken,
      );
      return _RefreshOutcome.ok(tokens);
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      if (status == 401 || status == 400 || status == 403) {
        return const _RefreshOutcome.giveUp();
      }
      rethrow;
    }
  }

  bool _shouldRefresh(DioException err) {
    if (err.response?.statusCode != 401) return false;
    final options = err.requestOptions;
    if (options.extra['retried'] == true || options.extra['skipAuth'] == true) {
      return false;
    }
    final path = options.path;
    if (path.contains(ApiConstants.login) ||
        path.contains(ApiConstants.refresh)) {
      return false;
    }
    return true;
  }

  Future<void> _expireQuietly() async {
    try {
      await onSessionExpired();
    } on Object {
      // The original 401 still needs to surface if cleanup fails.
    }
  }

  Future<String?> _read(TokenReader read) async {
    try {
      return await read();
    } on Object {
      return null;
    }
  }
}

class _RefreshOutcome {
  const _RefreshOutcome.ok(this.tokens) : signedIn = true, giveUp = false;

  const _RefreshOutcome.skipped()
    : tokens = null,
      signedIn = false,
      giveUp = false;

  const _RefreshOutcome.giveUp()
    : tokens = null,
      signedIn = true,
      giveUp = true;

  final RefreshedSession? tokens;
  final bool signedIn;
  final bool giveUp;
}
