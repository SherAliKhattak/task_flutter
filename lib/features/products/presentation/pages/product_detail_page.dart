import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/error_view.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_detail_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_detail_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_detail_styles.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_formatters.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/floor_review.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/product_gallery.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/spec_line.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/ticket_line.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ProductDetailCopy.brand,
          style: ProductDetailStyles.appBarTitle(controller.theme),
        ),
      ),
      body: Obx(() {
        if (controller.loading && controller.selected == null) {
          return const _DetailSkeleton();
        }
        if (controller.selected == null) {
          return Center(
            child: ErrorView(
              message: controller.message ?? ProductDetailCopy.loadError,
              onRetry: controller.load,
            ),
          );
        }
        return const _ProductBody();
      }),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          ShimmerBlock(height: 320.h),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBlock(width: 120.w, height: 10.h),
                SizedBox(height: 12.h),
                ShimmerBlock(height: 28.h),
                SizedBox(height: 8.h),
                ShimmerBlock(width: 210.w, height: 28.h),
                SizedBox(height: 20.h),
                ShimmerBlock(width: 108.w, height: 32.h),
                SizedBox(height: 14.h),
                ShimmerBlock(width: 240.w, height: 12.h),
                SizedBox(height: 32.h),
                ShimmerBlock(width: 56.w, height: 10.h),
                SizedBox(height: 12.h),
                ShimmerBlock(height: 14.h),
                SizedBox(height: 8.h),
                ShimmerBlock(height: 14.h),
                SizedBox(height: 8.h),
                ShimmerBlock(width: 260.w, height: 14.h),
                SizedBox(height: 32.h),
                TicketLine(),
                TicketLine(),
                TicketLine(),
                TicketLine(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductBody extends GetView<ProductDetailController> {
  const _ProductBody();

  Product get product => controller.selected!;

  String get category => formatCategory(product.category);

  String get status => stockLabel(
    availabilityStatus: product.availabilityStatus,
    stock: product.stock,
  );

  TextStyle? get meta => ProductDetailStyles.sectionLabel(controller.theme);

  String get facts => [
    if (product.discountPercentage > 0)
      formatDiscount(product.discountPercentage),
    ProductDetailCopy.rated(product.rating),
    status,
  ].join('   ·   ');

  String get tagLine => product.tags.map(formatCategory).join('  /  ');

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 36.h),
      children: [
        ColoredBox(
          color: controller.scheme.outline.withValues(alpha: 0.35),
          child: ProductGallery(images: product.gallery),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category.isNotEmpty)
                Text(category.toUpperCase(), style: meta),
              SizedBox(height: 6.h),
              Text(
                product.title,
                style: controller.theme.textTheme.headlineSmall,
              ),
              if (product.brand != null) ...[
                SizedBox(height: 4.h),
                Text(
                  product.brand!,
                  style: ProductDetailStyles.brand(controller.theme),
                ),
              ],
              SizedBox(height: 18.h),
              Text(
                formatPrice(product.price),
                style: ProductDetailStyles.price(controller.theme),
              ),
              SizedBox(height: 6.h),
              Text(facts, style: controller.theme.textTheme.bodyMedium),
              if (product.tags.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Text(
                  tagLine,
                  style: ProductDetailStyles.mutedSmall(controller.theme),
                ),
              ],
              if (product.description.isNotEmpty) ...[
                SizedBox(height: 28.h),
                Text(ProductDetailCopy.note, style: meta),
                SizedBox(height: 8.h),
                Text(
                  product.description,
                  style: controller.theme.textTheme.bodyLarge,
                ),
              ],
              SizedBox(height: 28.h),
              Text(ProductDetailCopy.ticket, style: meta),
              SizedBox(height: 4.h),
              SpecLine(label: ProductDetailCopy.sku, value: product.sku),
              SpecLine(
                label: ProductDetailCopy.stock,
                value: '${product.stock}',
              ),
              SpecLine(
                label: ProductDetailCopy.warranty,
                value: product.warrantyInformation,
              ),
              SpecLine(
                label: ProductDetailCopy.shipping,
                value: product.shippingInformation,
              ),
              SpecLine(
                label: ProductDetailCopy.returns,
                value: product.returnPolicy,
              ),
              if (product.reviews.isNotEmpty) ...[
                SizedBox(height: 28.h),
                Text(ProductDetailCopy.reviews, style: meta),
                SizedBox(height: 12.h),
                ...product.reviews.map(FloorReview.new),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
