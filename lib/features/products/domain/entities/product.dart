import 'package:equatable/equatable.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/review.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    this.description = '',
    this.category = '',
    required this.price,
    this.discountPercentage = 0,
    this.rating = 0,
    this.stock = 0,
    this.brand,
    this.sku = '',
    this.thumbnail = '',
    this.images = const [],
    this.availabilityStatus = '',
    this.warrantyInformation = '',
    this.shippingInformation = '',
    this.returnPolicy = '',
    this.tags = const [],
    this.reviews = const [],
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String? brand;
  final String sku;
  final String thumbnail;
  final List<String> images;
  final String availabilityStatus;
  final String warrantyInformation;
  final String shippingInformation;
  final String returnPolicy;
  final List<String> tags;
  final List<Review> reviews;

  List<String> get gallery {
    if (images.isNotEmpty) return images;
    if (thumbnail.isNotEmpty) return [thumbnail];
    return const [];
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    sku,
    thumbnail,
    images,
    availabilityStatus,
    warrantyInformation,
    shippingInformation,
    returnPolicy,
    tags,
    reviews,
  ];
}
