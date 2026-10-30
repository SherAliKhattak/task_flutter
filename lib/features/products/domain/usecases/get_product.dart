import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';

class GetProduct {
  const GetProduct(this._repository);

  final ProductRepository _repository;

  Stream<Result<Product>> call(int id) => _repository.getProduct(id);
}
