import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';

/// Stand-in for one floor-list row: index, photo, title, price.
class ProductRowSkeleton extends StatelessWidget {
  const ProductRowSkeleton({super.key, this.titleWidthFactor = 0.92});

  final double titleWidthFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: ShimmerBlock(width: 18.w, height: 12.h),
          ),
          SizedBox(width: 10.w),
          ShimmerBlock(width: 72.w, height: 88.h),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBlock(width: 88.w, height: 10.h),
                SizedBox(height: 8.h),
                FractionallySizedBox(
                  widthFactor: titleWidthFactor,
                  child: ShimmerBlock(height: 16.h),
                ),
                SizedBox(height: 6.h),
                FractionallySizedBox(
                  widthFactor: 0.62,
                  child: ShimmerBlock(height: 16.h),
                ),
                SizedBox(height: 10.h),
                ShimmerBlock(width: 28.w, height: 10.h),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: ShimmerBlock(width: 52.w, height: 14.h),
          ),
        ],
      ),
    );
  }
}
