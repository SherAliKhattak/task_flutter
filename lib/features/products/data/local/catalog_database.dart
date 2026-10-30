import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// Table and Column also exist in Flutter, so this file imports Drift directly.

part 'catalog_database.g.dart';

/// Saved floor list. Products are stored once; each fetched page records the
/// ids that belong on that limit/skip slice.
@DriftDatabase(
  tables: [Products, ProductImages, ProductTags, Reviews, Pages, PageItems],
)
class CatalogDatabase extends _$CatalogDatabase {
  CatalogDatabase([QueryExecutor? executor]) : super(executor ?? _open());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open() {
    return driftDatabase(name: 'marlow_catalog');
  }
}

@DataClassName('StoredProduct')
class Products extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get description => text().withDefault(const Constant(''))();

  TextColumn get category => text().withDefault(const Constant(''))();

  RealColumn get price => real()();

  RealColumn get discountPercentage => real().withDefault(const Constant(0))();

  RealColumn get rating => real().withDefault(const Constant(0))();

  IntColumn get stock => integer().withDefault(const Constant(0))();

  TextColumn get brand => text().nullable()();

  TextColumn get sku => text().withDefault(const Constant(''))();

  TextColumn get thumbnail => text().withDefault(const Constant(''))();

  TextColumn get availabilityStatus => text().withDefault(const Constant(''))();

  TextColumn get warrantyInformation =>
      text().withDefault(const Constant(''))();

  TextColumn get shippingInformation =>
      text().withDefault(const Constant(''))();

  TextColumn get returnPolicy => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

class ProductImages extends Table {
  IntColumn get productId => integer()();

  IntColumn get position => integer()();

  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {productId, position};
}

class ProductTags extends Table {
  IntColumn get productId => integer()();

  IntColumn get position => integer()();

  TextColumn get tag => text()();

  @override
  Set<Column> get primaryKey => {productId, position};
}

@DataClassName('StoredReview')
class Reviews extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer()();

  IntColumn get position => integer()();

  IntColumn get rating => integer()();

  TextColumn get comment => text().withDefault(const Constant(''))();

  TextColumn get reviewerName => text()();

  TextColumn get reviewedOn => text().nullable()();
}

class Pages extends Table {
  IntColumn get pageLimit => integer()();

  IntColumn get pageSkip => integer()();

  IntColumn get total => integer()();

  @override
  Set<Column> get primaryKey => {pageLimit, pageSkip};
}

class PageItems extends Table {
  IntColumn get pageLimit => integer()();

  IntColumn get pageSkip => integer()();

  IntColumn get position => integer()();

  IntColumn get productId => integer()();

  @override
  Set<Column> get primaryKey => {pageLimit, pageSkip, position};
}
