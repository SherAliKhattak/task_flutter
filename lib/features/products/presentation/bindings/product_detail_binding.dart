import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_product.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    final id = Get.arguments;
    if (id is! int) {
      throw ArgumentError.value(id, 'arguments', 'A product id is required.');
    }
    if (Get.isRegistered<ProductDetailController>()) {
      Get.delete<ProductDetailController>(force: true);
    }
    Get.put(
      ProductDetailController(
        productId: id,
        getProduct: Get.find<GetProduct>(),
      ),
    );
  }
}
