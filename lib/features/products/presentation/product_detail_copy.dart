/// Visible copy on the product detail screen.
abstract final class ProductDetailCopy {
  static const brand = 'MARLOW';
  static const loadError = 'This product could not be loaded.';
  static const note = 'NOTE';
  static const ticket = 'TICKET';
  static const reviews = 'FROM THE FLOOR';
  static const sku = 'SKU';
  static const stock = 'Stock';
  static const warranty = 'Warranty';
  static const shipping = 'Shipping';
  static const returns = 'Returns';

  static String rated(double rating) => 'Rated ${rating.toStringAsFixed(1)}';

  static String ratingOutOfFive(num rating) => '$rating/5';
}
