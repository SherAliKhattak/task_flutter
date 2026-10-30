import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_styles.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_row_skeleton.dart';

class ListFooter extends StatelessWidget {
  const ListFooter({
    super.key,
    required this.isLoadingMore,
    required this.hasMore,
  });

  final bool isLoadingMore;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    if (isLoadingMore) {
      return const Shimmer(
        child: Column(
          children: [
            ProductRowSkeleton(),
            ProductRowSkeleton(titleWidthFactor: 0.74),
          ],
        ),
      );
    }
    if (!hasMore) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(
          ProductListCopy.endOfList,
          textAlign: TextAlign.center,
          style: ProductListStyles.endCaption(Get.theme),
        ),
      );
    }
    return SizedBox(height: 24.h);
  }
}
