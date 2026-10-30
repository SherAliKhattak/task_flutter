import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/empty_view.dart';
import 'package:flutter_assignment_upwork/core/widgets/error.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/controllers/product_list_controller.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/product_list_copy.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/floor_list_skeleton.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/floor_list_title.dart';
import 'package:flutter_assignment_upwork/features/products/presentation/widgets/refreshable_message.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78.h,
        title: const FloorListTitle(),
        actions: [
          TextButton(
            onPressed: controller.confirmLogout,
            child: const Text(ProductListCopy.signOut),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.loading && controller.items.isEmpty) {
          return const FloorListSkeleton();
        }

        if (controller.message != null && controller.items.isEmpty) {
          return RefreshableMessage(
            onRefresh: controller.reload,
            child: ErrorView(
              message: controller.message!,
              onRetry: controller.loadInitial,
            ),
          );
        }

        if (controller.items.isEmpty) {
          return RefreshableMessage(
            onRefresh: controller.reload,
            child: const EmptyView(
              title: ProductListCopy.emptyTitle,
              message: ProductListCopy.emptyMessage,
            ),
          );
        }

        if (controller.canLoadMore) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => controller.fillIfShort(),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.reload,
          child: ListView.builder(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 24.h),
            itemCount: controller.items.length + 1,
            itemBuilder: controller.item,
          ),
        );
      }),
    );
  }
}
