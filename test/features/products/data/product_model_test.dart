import 'package:flutter_assignment_upwork/features/products/data/models/product_model.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_page_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses a product and ignores malformed optional fields', () {
    final product = ProductModel.fromJson({
      'id': 1,
      'title': 'Essence Mascara',
      'description': 'Lengthening mascara',
      'category': 'beauty',
      'price': 10,
      'discountPercentage': 7.17,
      'rating': 4.94,
      'stock': 5,
      'brand': null,
      'sku': 'RCH45Q1A',
      'thumbnail': 'https://cdn.dummyjson.com/thumb.png',
      'images': ['https://cdn.dummyjson.com/1.png', 3],
      'availabilityStatus': 'Low Stock',
      'tags': ['beauty', 1],
      'reviews': [
        {
          'rating': 5,
          'comment': 'Very satisfied!',
          'date': '2024-05-23T08:56:21.618Z',
          'reviewerName': 'Scarlett Wright',
        },
      ],
    });

    expect(product.brand, isNull);
    expect(product.price, 10);
    expect(product.images, ['https://cdn.dummyjson.com/1.png']);
    expect(product.tags, ['beauty']);
    expect(product.reviews.single.reviewerName, 'Scarlett Wright');
    expect(product.toEntity().gallery, ['https://cdn.dummyjson.com/1.png']);
  });

  test('parses a product page', () {
    final page = ProductPageModel.fromJson({
      'products': [
        {'id': 11, 'title': 'Annibale Colombo Bed', 'price': 1899.99},
      ],
      'total': 194,
      'skip': 10,
      'limit': 10,
    });

    final entity = page.toEntity();
    expect(entity.total, 194);
    expect(entity.skip, 10);
    expect(entity.products.single.title, 'Annibale Colombo Bed');
    expect(entity.products.single.price, 1899.99);
  });

  test('rejects a product without a title', () {
    expect(() => ProductModel.fromJson({'id': 1}), throwsFormatException);
  });
}
