import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';

/// Stand-in for one ticket row: label and value.
class TicketLine extends StatelessWidget {
  const TicketLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        children: [
          ShimmerBlock(width: 72.w, height: 10.h),
          SizedBox(width: 24.w),
          Expanded(child: ShimmerBlock(height: 12.h)),
        ],
      ),
    );
  }
}
