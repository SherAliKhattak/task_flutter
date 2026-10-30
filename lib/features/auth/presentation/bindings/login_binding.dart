import 'package:flutter_assignment_upwork/features/auth/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(login: Get.find(), navigator: Get.find()),
    );
  }
}
