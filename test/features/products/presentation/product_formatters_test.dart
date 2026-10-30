import 'package:flutter_assignment_upwork/features/products/presentation/product_formatters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formats prices, categories, and discounts', () {
    expect(formatPrice(9.99), r'$9.99');
    expect(formatPrice(28999.9), r'$28,999.90');
    expect(formatCategory('womens-dresses'), 'Womens Dresses');
    expect(formatDiscount(7.17), '7.2% off');
    expect(formatDiscount(10), '10% off');
    expect(stockLabel(availabilityStatus: '', stock: 0), 'Out of stock');
    expect(stockLabel(availabilityStatus: 'Low Stock', stock: 5), 'Low Stock');
  });
}
