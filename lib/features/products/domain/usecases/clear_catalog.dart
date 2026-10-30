import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';

class ClearCatalog {
  const ClearCatalog(this._repository);

  final ProductRepository _repository;

  Future<void> call() => _repository.clear();
}
