import 'dart:async';

import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/get_cached_user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/logout.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/clear_catalog.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_products.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_list_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeProductRepository products;
  late FakeAuthRepository auth;
  late RecordingNavigator navigator;
  late RecordingMessenger messenger;
  late ProductListController controller;

  setUp(() {
    products = FakeProductRepository();
    auth = FakeAuthRepository();
    navigator = RecordingNavigator();
    messenger = RecordingMessenger();
    controller = ProductListController(
      getProducts: GetProducts(products),
      clearCatalog: ClearCatalog(products),
      logout: Logout(auth),
      getCachedUser: GetCachedUser(auth),
      navigator: navigator,
      messenger: messenger,
    );
  });

  tearDown(() => controller.onClose());

  test('shows an error when the first page fails', () async {
    products.onGetProducts = (_, _) async {
      return const FailureResult(ServerFailure('Offline'));
    };

    await controller.loadInitial();

    expect(controller.products, isEmpty);
    expect(controller.errorMessage.value, 'Offline');
    expect(controller.isInitialLoading.value, isFalse);
  });

  test('shows an empty catalog when the server returns no products', () async {
    products.onGetProducts = (_, _) async {
      return const Success(sampleEmptyPage);
    };

    await controller.loadInitial();

    expect(controller.products, isEmpty);
    expect(controller.errorMessage.value, isNull);
    expect(controller.hasMore.value, isFalse);
  });

  test('appends the next page and then stops', () async {
    products.onGetProducts = (limit, skip) async {
      if (skip == 0) return Success(samplePage([1, 2], total: 3, skip: 0));
      return Success(samplePage([3], total: 3, skip: 2));
    };

    await controller.loadInitial();
    await controller.loadMore();
    await controller.loadMore();

    expect(controller.products.map((product) => product.id), [1, 2, 3]);
    expect(controller.hasMore.value, isFalse);
    expect(products.skips, [0, 2]);
  });

  test('keeps the current list when refresh fails', () async {
    var calls = 0;
    products.onGetProducts = (_, _) async {
      calls++;
      if (calls == 1) return Success(samplePage([1], total: 1, skip: 0));
      return const FailureResult(NetworkFailure());
    };

    await controller.loadInitial();
    await controller.reload();

    expect(controller.products.single.id, 1);
    expect(controller.errorMessage.value, isNull);
    expect(messenger.messages, ['Check your connection and try again.']);
  });

  test('ignores a stale page that finishes after refresh', () async {
    final first = Completer<Result<ProductPage>>();
    final second = Completer<Result<ProductPage>>();
    final responses = [first.future, second.future];
    var index = 0;
    products.onGetProducts = (_, _) => responses[index++];

    final initial = controller.loadInitial();
    final refreshed = controller.reload();
    second.complete(Success(samplePage([9], total: 1, skip: 0)));
    first.complete(Success(samplePage([1, 2], total: 2, skip: 0)));
    await Future.wait([initial, refreshed]);

    expect(controller.products.map((product) => product.id), [9]);
  });

  test(
    'shows the saved page, then replaces it with the network page',
    () async {
      products.onWatchProducts = (limit, skip) async* {
        yield Success(samplePage([1], total: 2, skip: 0));
        yield Success(samplePage([4, 5], total: 2, skip: 0));
      };

      await controller.loadInitial();

      expect(controller.products.map((product) => product.id), [4, 5]);
      expect(controller.errorMessage.value, isNull);
      expect(controller.isInitialLoading.value, isFalse);
    },
  );

  test('keeps the saved page when the network is down', () async {
    products.onWatchProducts = (limit, skip) async* {
      yield Success(samplePage([1], total: 1, skip: 0));
      yield const FailureResult(NetworkFailure());
    };

    await controller.loadInitial();

    expect(controller.products.single.id, 1);
    expect(controller.errorMessage.value, isNull);
    expect(messenger.messages, ['Check your connection and try again.']);
    expect(controller.isInitialLoading.value, isFalse);
  });

  test('replaces a saved next page instead of appending it twice', () async {
    products.onWatchProducts = (limit, skip) async* {
      if (skip == 0) {
        yield Success(samplePage([1], total: 2, skip: 0));
        return;
      }
      yield Success(samplePage([2], total: 2, skip: 1));
      yield Success(samplePage([8], total: 2, skip: 1));
    };

    await controller.loadInitial();
    await controller.loadMore();

    expect(controller.products.map((product) => product.id), [1, 8]);
    expect(controller.hasMore.value, isFalse);
  });

  test('logout clears the session and returns to login', () async {
    await controller.logout();

    expect(auth.logoutCalls, 1);
    expect(products.clearCount, 1);
    expect(navigator.loginRoutes, 1);
  });
}

const sampleEmptyPage = ProductPage(products: [], total: 0, skip: 0, limit: 0);
