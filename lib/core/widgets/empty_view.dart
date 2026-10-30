import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, required this.title, required this.message});

  final String title;
  final String message;

  ThemeData get theme => Get.theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.headlineSmall),
          SizedBox(height: 8.h),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
