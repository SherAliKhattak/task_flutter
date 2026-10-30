import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_messenger.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_navigator.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/get_cached_user.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/logout.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/clear_catalog.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_products.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductListController(
        getProducts: Get.find<GetProducts>(),
        clearCatalog: Get.find<ClearCatalog>(),
        logout: Get.find<Logout>(),
        getCachedUser: Get.find<GetCachedUser>(),
        navigator: Get.find<AppNavigator>(),
        messenger: Get.find<AppMessenger>(),
      ),
    );
  }
}
