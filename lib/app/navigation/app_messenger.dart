import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';

abstract class AppMessenger {
  void showMessage(String message);
}

class GetAppMessenger implements AppMessenger {
  const GetAppMessenger();

  @override
  void showMessage(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(16.w),
      borderRadius: 12.w,
      duration: const Duration(seconds: 3),
    );
  }
}
