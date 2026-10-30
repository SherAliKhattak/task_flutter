import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.memCacheWidth,
  });

  final String url;
  final BoxFit fit;
  final int? memCacheWidth;

  ColorScheme get scheme => Get.theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return ColoredBox(
        color: scheme.surfaceContainerHighest,
        child: Icon(Icons.image_outlined, color: scheme.onSurfaceVariant),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      memCacheWidth: memCacheWidth,
      placeholder: (_, _) => const Shimmer(child: ShimmerBlock()),
      errorWidget: (_, _, _) => ColoredBox(
        color: scheme.surfaceContainerHighest,
        child: Icon(
          Icons.broken_image_outlined,
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
