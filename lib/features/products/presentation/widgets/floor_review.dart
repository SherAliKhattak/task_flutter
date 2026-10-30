import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/review.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_detail_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_detail_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_detail_styles.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_formatters.dart';
import 'package:get/get.dart';

class FloorReview extends GetView<ProductDetailController> {
  const FloorReview(this.review, {super.key});

  final Review review;

  String get byline => [
    review.reviewerName,
    ProductDetailCopy.ratingOutOfFive(review.rating),
    ?formatReviewDate(review.date),
  ].whereType<String>().join('  ·  ');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: controller.scheme.secondary, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (review.comment.isNotEmpty)
            Text(
              review.comment,
              style: ProductDetailStyles.reviewQuote(controller.theme),
            ),
          SizedBox(height: 6.h),
          Text(byline, style: ProductDetailStyles.mutedSmall(controller.theme)),
        ],
      ),
    );
  }
}
