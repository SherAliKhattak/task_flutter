import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';

/// On-device catalog. Screens read this before the network, and a successful
/// response rewrites it.
abstract class ProductLocalDataSource {
  Future<ProductPage?> readPage({required int limit, required int skip});

  Future<void> savePage(ProductPage page);

  Future<Product?> readProduct(int id);

  Future<void> saveProduct(Product product);

  Future<void> clear();
}
