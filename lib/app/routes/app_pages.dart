import 'package:flutter_assignment_upwork/app/routes/app_routes.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/bindings/login_binding.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/bindings/product_detail_binding.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/bindings/product_list_binding.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/pages/product_detail_page.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/pages/product_list_page.dart';
import 'package:get/get.dart';

abstract final class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductListPage(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
  ];
}
