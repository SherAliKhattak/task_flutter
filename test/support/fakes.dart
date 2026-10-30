import 'dart:async';

import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/models/user_model.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_messenger.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_navigator.dart';

class RecordingNavigator implements AppNavigator {
  int productRoutes = 0;
  int loginRoutes = 0;
  final openedProducts = <int>[];

  @override
  void goToProducts() => productRoutes++;

  @override
  void goToLogin() => loginRoutes++;

  @override
  void openProduct(int id) => openedProducts.add(id);
}

class RecordingMessenger implements AppMessenger {
  final messages = <String>[];

  @override
  void showMessage(String message) => messages.add(message);
}

class FakeAuthRepository implements AuthRepository {
  Result<User>? loginResult;
  User? cachedUser;
  int loginCalls = 0;
  int logoutCalls = 0;

  @override
  Future<Result<User>> login({
    required String username,
    required String password,
  }) async {
    loginCalls++;
    return loginResult!;
  }

  @override
  Future<User?> getCachedUser() async => cachedUser;

  @override
  Future<void> logout() async {
    logoutCalls++;
  }
}

class FakeAuthRemote implements AuthRemoteDataSource {
  AuthSessionModel? session;
  Object? error;

  @override
  Future<AuthSessionModel> login({
    required String username,
    required String password,
  }) async {
    final thrown = error;
    if (thrown != null) throw thrown;
    return session!;
  }
}

class FakeAuthLocal implements AuthLocalDataSource {
  String? accessToken;
  String? refreshToken;
  UserModel? user;
  Object? error;
  int clearCount = 0;

  @override
  Future<void> saveSession({
    required String accessToken,
    String? refreshToken,
    required UserModel user,
  }) async {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.user = user;
  }

  @override
  Future<String?> readAccessToken() async => accessToken;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> updateTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    this.accessToken = accessToken;
    if (refreshToken != null && refreshToken.isNotEmpty) {
      this.refreshToken = refreshToken;
    }
  }

  @override
  Future<UserModel?> readUser() async => user;

  @override
  Future<bool> hasSession() async {
    final thrown = error;
    if (thrown != null) throw thrown;
    return accessToken != null && accessToken!.isNotEmpty;
  }

  @override
  Future<void> clear() async {
    clearCount++;
    accessToken = null;
    refreshToken = null;
    user = null;
  }
}

class FakeProductRepository implements ProductRepository {
  Future<Result<ProductPage>> Function(int limit, int skip)? onGetProducts;
  Stream<Result<ProductPage>> Function(int limit, int skip)? onWatchProducts;
  final skips = <int>[];
  var clearCount = 0;

  @override
  Stream<Result<ProductPage>> getProducts({
    required int limit,
    required int skip,
  }) {
    skips.add(skip);
    final watch = onWatchProducts;
    if (watch != null) return watch(limit, skip);
    return Stream.fromFuture(onGetProducts!(limit, skip));
  }

  @override
  Stream<Result<Product>> getProduct(int id) =>
      Stream.error(UnimplementedError());

  @override
  Future<void> clear() async {
    clearCount++;
  }
}

Product sampleProduct({int id = 1, String title = 'Essence Mascara'}) {
  return Product(
    id: id,
    title: title,
    description: 'A catalog product',
    category: 'beauty',
    price: 9.99,
  );
}

ProductPage samplePage(List<int> ids, {required int total, required int skip}) {
  return ProductPage(
    products: [for (final id in ids) sampleProduct(id: id)],
    total: total,
    skip: skip,
    limit: ids.length,
  );
}

const sampleUser = User(
  id: 1,
  username: 'emilys',
  email: 'emily.johnson@x.dummyjson.com',
  firstName: 'Emily',
  lastName: 'Johnson',
);
