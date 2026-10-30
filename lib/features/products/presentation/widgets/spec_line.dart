import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_detail_styles.dart';

/// One ticket row: a short label and its value.
class SpecLine extends StatelessWidget {
  const SpecLine({super.key, required this.label, required this.value});

  final String label;
  final String value;

  ThemeData get theme => Get.theme;

  ColorScheme get scheme => theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    if (value.trim().isEmpty) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: scheme.outline)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96.w,
            child: Text(
              label.toUpperCase(),
              style: ProductDetailStyles.specLabel(theme),
            ),
          ),
          Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
