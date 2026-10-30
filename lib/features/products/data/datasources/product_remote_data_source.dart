import 'package:flutter_assignment_upwork/features/products/data/models/product_model.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_page_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductPageModel> getProducts({required int limit, required int skip});

  Future<ProductModel> getProduct(int id);
}
