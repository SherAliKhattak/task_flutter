import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_messenger.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_navigator.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/get_cached_user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/logout.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/clear_catalog.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_products.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/list_footer.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_list_row.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/sign_out_dialog.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  ProductListController({
    required GetProducts getProducts,
    required ClearCatalog clearCatalog,
    required Logout logout,
    required GetCachedUser getCachedUser,
    required AppNavigator navigator,
    required AppMessenger messenger,
  }) : _getProducts = getProducts,
       _clearCatalog = clearCatalog,
       _logout = logout,
       _getCachedUser = getCachedUser,
       _navigator = navigator,
       _messenger = messenger;

  static const pageSize = 10;

  final GetProducts _getProducts;
  final ClearCatalog _clearCatalog;
  final Logout _logout;
  final GetCachedUser _getCachedUser;
  final AppNavigator _navigator;
  final AppMessenger _messenger;

  final products = <Product>[].obs;
  final user = Rxn<User>();
  final isInitialLoading = true.obs;
  final isLoadingMore = false.obs;
  final errorMessage = Rxn<String>();
  final hasMore = true.obs;

  bool get loading => isInitialLoading.value;

  bool get loadingMore => isLoadingMore.value;

  bool get canLoadMore => hasMore.value;

  String? get message => errorMessage.value;

  String? get signedInName => user.value?.displayName;

  List<Product> get items => products();

  ThemeData get theme => Get.theme;

  ColorScheme get scheme => theme.colorScheme;

  final scrollController = ScrollController();

  int _skip = 0;
  int _generation = 0;
  bool _inFlight = false;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(onScroll);
    _loadUser();
    loadInitial();
  }

  @override
  void onClose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void onScroll() {
    if (isClosed || !scrollController.hasClients) return;
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 320) {
      unawaited(loadMore());
    }
  }

  void fillIfShort() {
    if (isClosed || !scrollController.hasClients) return;
    if (scrollController.position.maxScrollExtent < 48) {
      unawaited(loadMore());
    }
  }

  Widget item(BuildContext context, int index) {
    if (index == items.length) {
      return ListFooter(isLoadingMore: loadingMore, hasMore: canLoadMore);
    }
    return ProductListRow(index: index);
  }

  Future<void> confirmLogout() async {
    if (await Get.dialog<bool>(const SignOutDialog()) != true || isClosed) {
      return;
    }
    await logout();
  }

  Future<void> _loadUser() async {
    user.value = await _getCachedUser();
  }

  Future<void> loadInitial() => _load(reset: true);

  Future<void> reload() => loadInitial();

  Future<void> loadMore() => _load(reset: false);

  void openProduct(int id) => _navigator.openProduct(id);

  Future<void> logout() async {
    try {
      await _logout();
      try {
        await _clearCatalog();
      } on Object {
        // The session is already gone. A leftover catalog is cleared next time.
      }
      _navigator.goToLogin();
    } on Object {
      _messenger.showMessage(ProductListCopy.signOutFailed);
    }
  }

  /// [reset] starts a new page and invalidates any in-flight request so a
  /// slower response cannot overwrite a newer refresh.
  Future<void> _load({required bool reset}) async {
    if (!reset && (_inFlight || !hasMore.value)) return;

    final generation = reset ? ++_generation : _generation;
    final skip = reset ? 0 : _skip;
    final start = reset ? 0 : products.length;
    _inFlight = true;

    if (reset) {
      errorMessage.value = null;
      isLoadingMore.value = false;
      if (products.isEmpty) isInitialLoading.value = true;
    } else {
      isLoadingMore.value = true;
    }

    try {
      await for (final result in _getProducts(limit: pageSize, skip: skip)) {
        if (generation != _generation) return;
        switch (result) {
          case Success(:final data):
            _applyPage(start, data);
            errorMessage.value = null;
            isInitialLoading.value = false;
            isLoadingMore.value = false;
          case FailureResult(:final failure):
            if (products.isEmpty) {
              errorMessage.value = failure.message;
            } else {
              _messenger.showMessage(failure.message);
            }
            isInitialLoading.value = false;
            isLoadingMore.value = false;
        }
      }
    } finally {
      if (generation == _generation) {
        _inFlight = false;
        isLoadingMore.value = false;
        isInitialLoading.value = false;
      }
    }
  }

  /// Replaces the slice that started at [start], so a saved page and the
  /// later network page occupy the same rows instead of being appended twice.
  void _applyPage(int start, ProductPage data) {
    _skip = data.skip + data.products.length;
    hasMore.value = data.products.isNotEmpty && _skip < data.total;
    final head = start <= 0 ? const <Product>[] : products.take(start).toList();
    products.value = <Product>[...head, ...data.products];
  }
}
