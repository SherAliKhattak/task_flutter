import 'package:flutter/material.dart';
import 'package:flutter_assignment_upwork/app/navigation/app_navigator.dart';
import 'package:flutter_assignment_upwork/core/constants/demo_account.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController({required Login login, required AppNavigator navigator})
    : _login = login,
      _navigator = navigator;

  final Login _login;
  final AppNavigator _navigator;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  final isLoading = false.obs;
  final obscurePassword = true.obs;
  final errorMessage = Rxn<String>();

  bool get loading => isLoading.value;

  bool get passwordObscured => obscurePassword.value;

  String? get message => errorMessage.value;

  ThemeData get theme => Get.theme;

  ColorScheme get scheme => theme.colorScheme;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void fillDemoAccount() {
    usernameController.text = DemoAccount.username;
    passwordController.text = DemoAccount.password;
    errorMessage.value = null;
  }

  Future<void> submit() async {
    if (isLoading.value) return;

    final username = usernameController.text.trim();
    final password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Enter both username and password.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;
    final result = await _login(username: username, password: password);
    isLoading.value = false;

    switch (result) {
      case Success():
        _navigator.goToProducts();
      case FailureResult(:final failure):
        errorMessage.value = failure.message;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
