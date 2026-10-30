import 'package:drift/drift.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/local/catalog_database.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/review.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl({CatalogDatabase? database})
    : _database = database ?? CatalogDatabase();

  final CatalogDatabase _database;

  @override
  Future<ProductPage?> readPage({required int limit, required int skip}) async {
    final page =
        await (_database.select(_database.pages)..where(
              (row) => row.pageLimit.equals(limit) & row.pageSkip.equals(skip),
            ))
            .getSingleOrNull();
    if (page == null) return null;

    final slots =
        await (_database.select(_database.pageItems)
              ..where(
                (row) =>
                    row.pageLimit.equals(limit) & row.pageSkip.equals(skip),
              )
              ..orderBy([(row) => OrderingTerm.asc(row.position)]))
            .get();

    final products = <Product>[];
    for (final slot in slots) {
      final product = await readProduct(slot.productId);
      if (product == null) return null;
      products.add(product);
    }

    return ProductPage(
      products: products,
      total: page.total,
      skip: page.pageSkip,
      limit: page.pageLimit,
    );
  }

  @override
  Future<void> savePage(ProductPage page) {
    return _database.transaction(() async {
      for (final product in page.products) {
        await _writeProduct(product);
      }
      await _database
          .into(_database.pages)
          .insertOnConflictUpdate(
            PagesCompanion.insert(
              pageLimit: page.limit,
              pageSkip: page.skip,
              total: page.total,
            ),
          );
      await (_database.delete(_database.pageItems)..where(
            (row) =>
                row.pageLimit.equals(page.limit) &
                row.pageSkip.equals(page.skip),
          ))
          .go();
      for (var index = 0; index < page.products.length; index++) {
        await _database
            .into(_database.pageItems)
            .insert(
              PageItemsCompanion.insert(
                pageLimit: page.limit,
                pageSkip: page.skip,
                position: index,
                productId: page.products[index].id,
              ),
            );
      }
    });
  }

  @override
  Future<Product?> readProduct(int id) async {
    final row = await (_database.select(
      _database.products,
    )..where((product) => product.id.equals(id))).getSingleOrNull();
    if (row == null) return null;

    final images =
        await (_database.select(_database.productImages)
              ..where((image) => image.productId.equals(id))
              ..orderBy([(image) => OrderingTerm.asc(image.position)]))
            .get();
    final tags =
        await (_database.select(_database.productTags)
              ..where((tag) => tag.productId.equals(id))
              ..orderBy([(tag) => OrderingTerm.asc(tag.position)]))
            .get();
    final reviews =
        await (_database.select(_database.reviews)
              ..where((review) => review.productId.equals(id))
              ..orderBy([(review) => OrderingTerm.asc(review.position)]))
            .get();

    return Product(
      id: row.id,
      title: row.title,
      description: row.description,
      category: row.category,
      price: row.price,
      discountPercentage: row.discountPercentage,
      rating: row.rating,
      stock: row.stock,
      brand: row.brand,
      sku: row.sku,
      thumbnail: row.thumbnail,
      images: [for (final image in images) image.url],
      availabilityStatus: row.availabilityStatus,
      warrantyInformation: row.warrantyInformation,
      shippingInformation: row.shippingInformation,
      returnPolicy: row.returnPolicy,
      tags: [for (final tag in tags) tag.tag],
      reviews: [for (final review in reviews) _review(review)],
    );
  }

  @override
  Future<void> saveProduct(Product product) {
    return _database.transaction(() => _writeProduct(product));
  }

  @override
  Future<void> clear() {
    return _database.transaction(() async {
      await _database.delete(_database.pageItems).go();
      await _database.delete(_database.pages).go();
      await _database.delete(_database.reviews).go();
      await _database.delete(_database.productTags).go();
      await _database.delete(_database.productImages).go();
      await _database.delete(_database.products).go();
    });
  }

  Future<void> _writeProduct(Product product) async {
    await _database
        .into(_database.products)
        .insertOnConflictUpdate(
          ProductsCompanion(
            id: Value(product.id),
            title: Value(product.title),
            description: Value(product.description),
            category: Value(product.category),
            price: Value(product.price),
            discountPercentage: Value(product.discountPercentage),
            rating: Value(product.rating),
            stock: Value(product.stock),
            brand: Value(product.brand),
            sku: Value(product.sku),
            thumbnail: Value(product.thumbnail),
            availabilityStatus: Value(product.availabilityStatus),
            warrantyInformation: Value(product.warrantyInformation),
            shippingInformation: Value(product.shippingInformation),
            returnPolicy: Value(product.returnPolicy),
          ),
        );

    await (_database.delete(
      _database.productImages,
    )..where((row) => row.productId.equals(product.id))).go();
    await (_database.delete(
      _database.productTags,
    )..where((row) => row.productId.equals(product.id))).go();
    await (_database.delete(
      _database.reviews,
    )..where((row) => row.productId.equals(product.id))).go();

    for (var index = 0; index < product.images.length; index++) {
      await _database
          .into(_database.productImages)
          .insert(
            ProductImagesCompanion.insert(
              productId: product.id,
              position: index,
              url: product.images[index],
            ),
          );
    }
    for (var index = 0; index < product.tags.length; index++) {
      await _database
          .into(_database.productTags)
          .insert(
            ProductTagsCompanion.insert(
              productId: product.id,
              position: index,
              tag: product.tags[index],
            ),
          );
    }
    for (var index = 0; index < product.reviews.length; index++) {
      final review = product.reviews[index];
      await _database
          .into(_database.reviews)
          .insert(
            ReviewsCompanion.insert(
              productId: product.id,
              position: index,
              rating: review.rating,
              comment: Value(review.comment),
              reviewerName: review.reviewerName,
              reviewedOn: Value(review.date?.toIso8601String()),
            ),
          );
    }
  }

  Review _review(StoredReview row) {
    final rawDate = row.reviewedOn;
    return Review(
      rating: row.rating,
      comment: row.comment,
      reviewerName: row.reviewerName,
      date: rawDate == null ? null : DateTime.tryParse(rawDate),
    );
  }
}
