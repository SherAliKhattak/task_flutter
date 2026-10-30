import 'package:flutter_assignment_upwork/app/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppNavigator {
  void goToProducts();

  void goToLogin();

  void openProduct(int id);
}

class GetAppNavigator implements AppNavigator {
  const GetAppNavigator();

  @override
  void goToProducts() => Get.offAllNamed(AppRoutes.products);

  @override
  void goToLogin() => Get.offAllNamed(AppRoutes.login);

  @override
  void openProduct(int id) {
    Get.toNamed(AppRoutes.productDetail, arguments: id);
  }
}
