import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/products/domain/entities/product.dart';
import 'package:flutter_assignment_upwork/features/products/domain/usecases/get_product.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductDetailController({
    required this.productId,
    required GetProduct getProduct,
  }) : _getProduct = getProduct;

  final int productId;
  final GetProduct _getProduct;

  final product = Rxn<Product>();
  final isLoading = true.obs;
  final errorMessage = Rxn<String>();
  final imageIndex = 0.obs;

  bool get loading => isLoading.value;

  Product? get selected => product.value;

  String? get message => errorMessage.value;

  int get index => imageIndex.value;

  ThemeData get theme => Get.theme;

  ColorScheme get scheme => theme.colorScheme;

  void selectImage(int value) {
    imageIndex.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    errorMessage.value = null;
    if (product.value == null) isLoading.value = true;
    await for (final result in _getProduct(productId)) {
      switch (result) {
        case Success(:final data):
          product.value = data;
          isLoading.value = false;
        case FailureResult(:final failure):
          isLoading.value = false;
          if (product.value == null) {
            errorMessage.value = failure.message;
          }
      }
    }
  }
}
