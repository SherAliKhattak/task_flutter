import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_formatters.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_image.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.index,
  });

  final Product product;
  final VoidCallback onTap;
  final int index;

  ThemeData get theme => Get.theme;

  ColorScheme get scheme => theme.colorScheme;

  String get category => formatCategory(product.category);

  String get number => (index + 1).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 28.w,
              child: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  number,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: scheme.secondary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
            ColoredBox(
              color: scheme.outline.withValues(alpha: 0.45),
              child: SizedBox(
                width: 72.w,
                height: 88.h,
                child: ProductImage(url: product.thumbnail, memCacheWidth: 220),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (category.isNotEmpty)
                    Text(
                      category.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.2,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  SizedBox(height: 4.h),
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: 'Georgia',
                      fontFamilyFallback: const ['Times New Roman', 'serif'],
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              formatPrice(product.price),
              style: theme.textTheme.titleSmall?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
