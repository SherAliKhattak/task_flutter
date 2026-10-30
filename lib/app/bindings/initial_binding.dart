import 'package:dio/dio.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_messenger.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_navigator.dart';
import 'package:flutter_assignment_upwork/app/routes/app_routes.dart';
import 'package:flutter_assignment_upwork/core/network/dio_client.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/get_cached_user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/login.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/logout.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_remote_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/clear_catalog.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_products.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    final local = AuthLocalDataSourceImpl();
    Get.put<AuthLocalDataSource>(local, permanent: true);
    final catalog = ProductLocalDataSourceImpl();
    Get.put<ProductLocalDataSource>(catalog, permanent: true);

    final dio = createDio(
      readAccessToken: local.readAccessToken,
      readRefreshToken: local.readRefreshToken,
      persistTokens: (accessToken, refreshToken) {
        return local.updateTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      },
      onSessionExpired: () async {
        await local.clear();
        try {
          await catalog.clear();
        } on Object {
          // The session is already cleared. The next launch can retry the wipe.
        }
        if (Get.currentRoute != AppRoutes.login) {
          Get.offAllNamed(AppRoutes.login);
        }
      },
    );
    Get.put<Dio>(dio, permanent: true);

    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(dio),
      permanent: true,
    );
    Get.put<ProductRemoteDataSource>(
      ProductRemoteDataSourceImpl(dio),
      permanent: true,
    );

    final authRepository = AuthRepositoryImpl(
      remote: Get.find(),
      local: Get.find(),
    );
    Get.put<AuthRepository>(authRepository, permanent: true);
    final productRepository = ProductRepositoryImpl(
      remote: Get.find(),
      local: Get.find(),
    );
    Get.put<ProductRepository>(productRepository, permanent: true);

    Get.put(Login(authRepository), permanent: true);
    Get.put(Logout(authRepository), permanent: true);
    Get.put(GetCachedUser(authRepository), permanent: true);
    Get.put(GetProducts(productRepository), permanent: true);
    Get.put(GetProduct(productRepository), permanent: true);
    Get.put(ClearCatalog(productRepository), permanent: true);

    Get.put<AppNavigator>(const GetAppNavigator(), permanent: true);
    Get.put<AppMessenger>(const GetAppMessenger(), permanent: true);
  }
}
