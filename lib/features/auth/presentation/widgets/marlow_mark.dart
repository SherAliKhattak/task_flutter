import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:get/get.dart';

/// Rust square and wordmark at the top of the staff entrance.
class MarlowMark extends StatelessWidget {
  const MarlowMark({super.key});

  ThemeData get theme => Get.theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14.w,
          height: 14.w,
          color: theme.colorScheme.secondary,
        ),
        SizedBox(width: 10.w),
        Text(
          'MARLOW',
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 3.2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
