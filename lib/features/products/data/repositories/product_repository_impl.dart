import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/core/network/result_guard.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required this.remote, required this.local});

  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;

  @override
  Stream<Result<ProductPage>> getProducts({
    required int limit,
    required int skip,
  }) async* {
    final cached = await _readPage(limit: limit, skip: skip);
    if (cached != null) yield Success(cached);

    final fresh = await guardRequest(() async {
      final page = await remote.getProducts(limit: limit, skip: skip);
      return page.toEntity();
    });
    switch (fresh) {
      case Success(:final data):
        await _savePage(data);
        yield Success(data);
      case FailureResult():
        yield fresh;
    }
  }

  @override
  Stream<Result<Product>> getProduct(int id) async* {
    final cached = await _readProduct(id);
    if (cached != null) yield Success(cached);

    final fresh = await guardRequest(() async {
      final product = await remote.getProduct(id);
      return product.toEntity();
    });
    switch (fresh) {
      case Success(:final data):
        await _saveProduct(data);
        yield Success(data);
      case FailureResult():
        yield fresh;
    }
  }

  @override
  Future<void> clear() => local.clear();

  Future<ProductPage?> _readPage({
    required int limit,
    required int skip,
  }) async {
    try {
      return await local.readPage(limit: limit, skip: skip);
    } on Object {
      return null;
    }
  }

  Future<Product?> _readProduct(int id) async {
    try {
      return await local.readProduct(id);
    } on Object {
      return null;
    }
  }

  Future<void> _savePage(ProductPage page) async {
    try {
      await local.savePage(page);
    } on Object {
      // The screen can still show the network page if the disk write fails.
    }
  }

  Future<void> _saveProduct(Product product) async {
    try {
      await local.saveProduct(product);
    } on Object {
      // The screen can still show the network product if the disk write fails.
    }
  }
}
