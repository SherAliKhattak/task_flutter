import 'package:equatable/equatable.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';

class ProductPage extends Equatable {
  const ProductPage({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  @override
  List<Object?> get props => [products, total, skip, limit];
}
