import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';

abstract class ProductRepository {
  /// Emits the saved page first when one exists, then the network page after
  /// it has been written locally. A failure is still emitted when the network
  /// call fails, including when a saved page was already emitted.
  Stream<Result<ProductPage>> getProducts({
    required int limit,
    required int skip,
  });

  /// Emits the saved product first when one exists, then the network product.
  Stream<Result<Product>> getProduct(int id);

  Future<void> clear();
}
