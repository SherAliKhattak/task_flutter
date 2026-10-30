import 'package:flutter_assignment_upwork/core/network/json_utils.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/review.dart';

class ReviewModel {
  const ReviewModel({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    this.date,
  });

  final int rating;
  final String comment;
  final String reviewerName;
  final DateTime? date;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final rawDate = json['date'];
    return ReviewModel(
      rating: asInt(json['rating']),
      comment: asString(json['comment']),
      reviewerName: asString(json['reviewerName'], fallback: 'Anonymous'),
      date: rawDate is String ? DateTime.tryParse(rawDate) : null,
    );
  }

  factory ReviewModel.fromEntity(Review review) {
    return ReviewModel(
      rating: review.rating,
      comment: review.comment,
      reviewerName: review.reviewerName,
      date: review.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'reviewerName': reviewerName,
      if (date != null) 'date': date!.toIso8601String(),
    };
  }

  Review toEntity() {
    return Review(
      rating: rating,
      comment: comment,
      reviewerName: reviewerName,
      date: date,
    );
  }
}

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.sku,
    required this.thumbnail,
    required this.images,
    required this.availabilityStatus,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.returnPolicy,
    required this.tags,
    required this.reviews,
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
  final List<ReviewModel> reviews;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    if (id is! num || title is! String || title.isEmpty) {
      throw const FormatException('Product is missing an id or title.');
    }
    final brand = json['brand'];
    return ProductModel(
      id: id.toInt(),
      title: title,
      description: asString(json['description']),
      category: asString(json['category']),
      price: asDouble(json['price']),
      discountPercentage: asDouble(json['discountPercentage']),
      rating: asDouble(json['rating']),
      stock: asInt(json['stock']),
      brand: brand is String && brand.trim().isNotEmpty ? brand.trim() : null,
      sku: asString(json['sku']),
      thumbnail: asString(json['thumbnail']),
      images: asStringList(json['images']),
      availabilityStatus: asString(json['availabilityStatus']),
      warrantyInformation: asString(json['warrantyInformation']),
      shippingInformation: asString(json['shippingInformation']),
      returnPolicy: asString(json['returnPolicy']),
      tags: asStringList(json['tags']),
      reviews: _reviews(json['reviews']),
    );
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      category: product.category,
      price: product.price,
      discountPercentage: product.discountPercentage,
      rating: product.rating,
      stock: product.stock,
      brand: product.brand,
      sku: product.sku,
      thumbnail: product.thumbnail,
      images: product.images,
      availabilityStatus: product.availabilityStatus,
      warrantyInformation: product.warrantyInformation,
      shippingInformation: product.shippingInformation,
      returnPolicy: product.returnPolicy,
      tags: product.tags,
      reviews: product.reviews.map(ReviewModel.fromEntity).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      if (brand != null) 'brand': brand,
      'sku': sku,
      'thumbnail': thumbnail,
      'images': images,
      'availabilityStatus': availabilityStatus,
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'returnPolicy': returnPolicy,
      'tags': tags,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      brand: brand,
      sku: sku,
      thumbnail: thumbnail,
      images: images,
      availabilityStatus: availabilityStatus,
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      returnPolicy: returnPolicy,
      tags: tags,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  static List<ReviewModel> _reviews(dynamic raw) {
    if (raw is! List) return const [];
    final reviews = <ReviewModel>[];
    for (final item in raw) {
      if (item is Map) {
        reviews.add(ReviewModel.fromJson(Map<String, dynamic>.from(item)));
      }
    }
    return reviews;
  }
}
