import 'package:flutter_assignment_upwork/core/network/json_utils.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_model.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';

class ProductPageModel {
  const ProductPageModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  factory ProductPageModel.fromJson(Map<String, dynamic> json) {
    final raw = json['products'];
    final products = <ProductModel>[];
    if (raw is List) {
      for (final item in raw) {
        if (item is Map) {
          products.add(ProductModel.fromJson(Map<String, dynamic>.from(item)));
        }
      }
    }
    return ProductPageModel(
      products: products,
      total: json['total'] == null ? products.length : asInt(json['total']),
      skip: asInt(json['skip']),
      limit: json['limit'] == null ? products.length : asInt(json['limit']),
    );
  }

  ProductPage toEntity() {
    return ProductPage(
      products: products.map((product) => product.toEntity()).toList(),
      total: total,
      skip: skip,
      limit: limit,
    );
  }
}
