import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';

class GetProducts {
  const GetProducts(this._repository);

  final ProductRepository _repository;

  Stream<Result<ProductPage>> call({required int limit, required int skip}) {
    return _repository.getProducts(limit: limit, skip: skip);
  }
}
