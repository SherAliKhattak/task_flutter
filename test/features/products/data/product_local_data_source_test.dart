import 'package:drift/native.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_local_data_source_impl.dart';
import 'package:flutter_assignment_upwork/features/products/data/local/catalog_database.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product_page.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/review.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CatalogDatabase database;
  late ProductLocalDataSourceImpl local;

  setUp(() {
    database = CatalogDatabase(NativeDatabase.memory());
    local = ProductLocalDataSourceImpl(database: database);
  });

  tearDown(() => database.close());

  test('round-trips a page and a single product', () async {
    final page = ProductPage(
      products: [
        Product(
          id: 1,
          title: 'Essence Mascara',
          description: 'A catalog product',
          category: 'beauty',
          price: 9.99,
          discountPercentage: 1.5,
          rating: 4.2,
          stock: 3,
          brand: 'Essence',
          sku: 'BEA-1',
          thumbnail: 'https://example.test/thumb.jpg',
          images: const ['https://example.test/1.jpg'],
          availabilityStatus: 'In Stock',
          warrantyInformation: '1 year',
          shippingInformation: 'Ships overnight',
          returnPolicy: '30 days',
          tags: const ['beauty', 'mascara'],
          reviews: [
            Review(
              rating: 5,
              comment: 'Excellent',
              reviewerName: 'Ada',
              date: DateTime.utc(2024, 5, 1, 12),
            ),
          ],
        ),
      ],
      total: 4,
      skip: 0,
      limit: 1,
    );

    await local.savePage(page);
    await local.saveProduct(
      const Product(id: 2, title: 'Table Lamp', price: 49.99),
    );

    final stored = await local.readPage(limit: 1, skip: 0);
    expect(stored, page);
    expect((await local.readProduct(2))?.title, 'Table Lamp');
    expect(await local.readProduct(9), isNull);
    expect(await local.readPage(limit: 1, skip: 10), isNull);
  });

  test('clear removes the saved catalog', () async {
    await local.saveProduct(const Product(id: 1, title: 'Juice', price: 3.99));

    await local.clear();

    expect(await local.readProduct(1), isNull);
  });

  test('a page that points at a missing product is treated as empty', () async {
    await database
        .into(database.pages)
        .insert(PagesCompanion.insert(pageLimit: 10, pageSkip: 0, total: 1));
    await database
        .into(database.pageItems)
        .insert(
          PageItemsCompanion.insert(
            pageLimit: 10,
            pageSkip: 0,
            position: 0,
            productId: 99,
          ),
        );

    expect(await local.readPage(limit: 10, skip: 0), isNull);
  });
}
