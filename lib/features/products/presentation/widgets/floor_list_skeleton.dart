import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_row_skeleton.dart';
import 'package:get/get.dart';

class FloorListSkeleton extends StatelessWidget {
  const FloorListSkeleton({super.key});

  Color get line => Get.theme.dividerColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        separatorBuilder: (_, _) => Divider(height: 1, color: line),
        itemBuilder: (context, index) {
          return ProductRowSkeleton(
            titleWidthFactor: index.isEven ? 0.92 : 0.7,
          );
        },
      ),
    );
  }
}
