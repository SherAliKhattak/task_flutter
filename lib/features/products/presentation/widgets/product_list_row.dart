import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_list_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_card.dart';

class ProductListRow extends GetView<ProductListController> {
  const ProductListRow({super.key, required this.index});

  final int index;

  Product get product => controller.items[index];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 0)
          Divider(height: 1, color: controller.theme.dividerColor),
        ProductCard(
          product: product,
          index: index,
          onTap: () => controller.openProduct(product.id),
        ),
        Divider(height: 1, color: controller.theme.dividerColor),
      ],
    );
  }
}
