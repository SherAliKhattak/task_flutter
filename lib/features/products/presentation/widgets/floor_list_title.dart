import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_list_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_styles.dart';

class FloorListTitle extends GetView<ProductListController> {
  const FloorListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ProductListCopy.brand,
            style: ProductListStyles.brand(controller.theme),
          ),
          Text(
            ProductListCopy.title,
            style: ProductListStyles.screenTitle(controller.theme),
          ),
          if (controller.signedInName != null)
            Text(
              controller.signedInName!,
              style: ProductListStyles.signedInName(controller.theme),
            ),
        ],
      ),
    );
  }
}
