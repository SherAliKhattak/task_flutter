import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/core/network/auth_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('saves a new token and retries once after 401', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    final adapter = _ScriptedAdapter([
      _body('{"message":"Token Expired!"}', 401),
      _body('{"ok":true}', 200),
    ]);
    dio.httpClientAdapter = adapter;

    var refreshes = 0;
    var currentAccess = 'old-access';
    String? savedAccess;
    String? savedRefresh;
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        readAccessToken: () async => currentAccess,
        readRefreshToken: () async => 'old-refresh',
        persistTokens: (accessToken, refreshToken) async {
          currentAccess = accessToken;
          savedAccess = accessToken;
          savedRefresh = refreshToken;
        },
        refresh: (refreshToken) async {
          refreshes++;
          expect(refreshToken, 'old-refresh');
          return const RefreshedSession(
            accessToken: 'new-access',
            refreshToken: 'new-refresh',
          );
        },
        onSessionExpired: () async => fail('session should stay signed in'),
      ),
    );

    final response = await dio.get<Map<String, dynamic>>('/products');

    expect(response.statusCode, 200);
    expect(response.data?['ok'], isTrue);
    expect(refreshes, 1);
    expect(savedAccess, 'new-access');
    expect(savedRefresh, 'new-refresh');
    expect(adapter.paths, ['/products', '/products']);
    expect(adapter.authorizations.last, 'Bearer new-access');
  });

  test('shares one refresh across overlapping 401s', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    dio.httpClientAdapter = _ScriptedAdapter([
      _body('{"message":"expired"}', 401),
      _body('{"message":"expired"}', 401),
      _body('{"n":1}', 200),
      _body('{"n":2}', 200),
    ]);

    final gate = Completer<RefreshedSession>();
    var refreshes = 0;
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        readAccessToken: () async => 'old-access',
        readRefreshToken: () async => 'old-refresh',
        persistTokens: (accessToken, refreshToken) async {},
        refresh: (_) {
          refreshes++;
          return gate.future;
        },
        onSessionExpired: () async => fail('session should stay signed in'),
      ),
    );

    final first = dio.get<Map<String, dynamic>>('/products');
    final second = dio.get<Map<String, dynamic>>('/products');
    for (var i = 0; i < 50 && refreshes == 0; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    // Keep the refresh open so the second 401 can join it.
    for (var i = 0; i < 50; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(refreshes, 1);
    gate.complete(const RefreshedSession(accessToken: 'new-access'));

    final responses = await Future.wait([first, second]);
    expect(refreshes, 1);
    expect(responses.map((response) => response.statusCode), [200, 200]);
  });

  test('clears the session when refresh is rejected', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    dio.httpClientAdapter = _ScriptedAdapter([
      _body('{"message":"Token Expired!"}', 401),
    ]);

    var expired = 0;
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        readAccessToken: () async => 'old-access',
        readRefreshToken: () async => 'old-refresh',
        persistTokens: (accessToken, refreshToken) async {},
        refresh: (_) async => null,
        onSessionExpired: () async => expired++,
      ),
    );

    await expectLater(
      dio.get<dynamic>('/products'),
      throwsA(isA<DioException>()),
    );
    expect(expired, 1);
  });

  test('does not refresh when nobody is signed in', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    dio.httpClientAdapter = _ScriptedAdapter([
      _body('{"message":"unauthorized"}', 401),
    ]);

    var refreshes = 0;
    var expired = 0;
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        readAccessToken: () async => null,
        readRefreshToken: () async => null,
        persistTokens: (accessToken, refreshToken) async {},
        refresh: (_) async {
          refreshes++;
          return null;
        },
        onSessionExpired: () async => expired++,
      ),
    );

    await expectLater(
      dio.get<dynamic>('/products'),
      throwsA(isA<DioException>()),
    );
    expect(refreshes, 0);
    expect(expired, 0);
  });
}

ResponseBody _body(String json, int status) {
  return ResponseBody.fromString(
    json,
    status,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

class _ScriptedAdapter implements HttpClientAdapter {
  _ScriptedAdapter(this._responses);

  final List<ResponseBody> _responses;
  final paths = <String>[];
  final authorizations = <String?>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    paths.add(options.path);
    authorizations.add(options.headers['Authorization'] as String?);
    return _responses.removeAt(0);
  }

  @override
  void close({bool force = false}) {}
}
