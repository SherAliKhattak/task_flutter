import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_detail_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_image.dart';
import 'package:get/get.dart';

class ProductGallery extends GetView<ProductDetailController> {
  const ProductGallery({super.key, required this.images});

  final List<String> images;

  Widget get _marks => Obx(
    () => Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < images.length; i++)
            Container(
              width: i == controller.index ? 18.w : 8.w,
              height: 3.h,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              color: i == controller.index
                  ? controller.scheme.secondary
                  : controller.scheme.surface,
            ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ColoredBox(
        color: controller.scheme.surfaceContainerHighest,
        child: SizedBox(
          height: 280.h,
          child: Center(child: Icon(Icons.image_outlined, size: 48.w)),
        ),
      );
    }

    return SizedBox(
      height: 320.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: images.length,
            onPageChanged: controller.selectImage,
            itemBuilder: (context, index) {
              return ProductImage(url: images[index]);
            },
          ),
          if (images.length > 1) _marks,
        ],
      ),
    );
  }
}
