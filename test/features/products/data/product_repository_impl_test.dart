import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/products/data/local/catalog_database.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_model.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_page_model.dart';
import 'package:flutter_assignment_upwork/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CatalogDatabase database;
  late ProductLocalDataSourceImpl local;
  late _ScriptedRemote remote;
  late ProductRepositoryImpl repository;

  setUp(() {
    database = CatalogDatabase(NativeDatabase.memory());
    local = ProductLocalDataSourceImpl(database: database);
    remote = _ScriptedRemote();
    repository = ProductRepositoryImpl(remote: remote, local: local);
  });

  tearDown(() => database.close());

  test('emits the saved page and then the page from the network', () async {
    await local.savePage(_page(id: 1, title: 'Saved'));
    remote.page = _model(_page(id: 2, title: 'Fresh'));

    final results = await repository.getProducts(limit: 1, skip: 0).toList();

    expect(_title(results[0]), 'Saved');
    expect(_title(results[1]), 'Fresh');
    expect((await local.readProduct(2))?.title, 'Fresh');
  });

  test('keeps the saved product when the network cannot be reached', () async {
    await local.saveProduct(
      const Product(id: 7, title: 'Cached lamp', price: 49.99),
    );
    remote.error = DioException(
      requestOptions: RequestOptions(path: '/products/7'),
      type: DioExceptionType.connectionError,
    );

    final results = await repository.getProduct(7).toList();

    expect(_title(results.first), 'Cached lamp');
    final failure = results.last;
    expect(failure, isA<FailureResult<Product>>());
    expect((failure as FailureResult<Product>).failure, isA<NetworkFailure>());
    expect((await local.readProduct(7))?.title, 'Cached lamp');
  });
}

class _ScriptedRemote implements ProductRemoteDataSource {
  ProductPageModel? page;
  DioException? error;

  @override
  Future<ProductPageModel> getProducts({
    required int limit,
    required int skip,
  }) async {
    final thrown = error;
    if (thrown != null) throw thrown;
    return page!;
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    final thrown = error;
    if (thrown != null) throw thrown;
    throw StateError('No product scripted');
  }
}

ProductPage _page({required int id, required String title}) {
  return ProductPage(
    products: [Product(id: id, title: title, price: 1)],
    total: 1,
    skip: 0,
    limit: 1,
  );
}

ProductPageModel _model(ProductPage page) {
  return ProductPageModel(
    products: page.products.map(ProductModel.fromEntity).toList(),
    total: page.total,
    skip: page.skip,
    limit: page.limit,
  );
}

String _title(Result<dynamic> result) {
  return switch (result) {
    Success(:final data) when data is Product => data.title,
    Success(:final data) when data is ProductPage => data.products.single.title,
    _ => '',
  };
}
