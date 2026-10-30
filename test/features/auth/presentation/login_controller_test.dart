import 'package:flutter_assignment_upwork/core/constants/demo_account.dart';
import 'package:flutter_assignment_upwork/core/error/failure.dart';
import 'package:flutter_assignment_upwork/core/error/result.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/login.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeAuthRepository auth;
  late RecordingNavigator navigator;
  late LoginController controller;

  setUp(() {
    auth = FakeAuthRepository();
    navigator = RecordingNavigator();
    controller = LoginController(login: Login(auth), navigator: navigator);
  });

  tearDown(() => controller.onClose());

  test('requires both username and password', () async {
    await controller.submit();

    expect(controller.errorMessage.value, 'Enter both username and password.');
    expect(auth.loginCalls, 0);
    expect(navigator.productRoutes, 0);
  });

  test('trims the username before signing in', () async {
    auth.loginResult = const Success(sampleUser);
    controller.usernameController.text = '  ${DemoAccount.username}  ';
    controller.passwordController.text = DemoAccount.password;

    await controller.submit();

    expect(navigator.productRoutes, 1);
    expect(controller.isLoading.value, isFalse);
    expect(controller.errorMessage.value, isNull);
  });

  test('shows the server message when login fails', () async {
    auth.loginResult = const FailureResult(
      ServerFailure('Invalid credentials'),
    );
    controller.usernameController.text = DemoAccount.username;
    controller.passwordController.text = 'wrong';

    await controller.submit();

    expect(controller.errorMessage.value, 'Invalid credentials');
    expect(navigator.productRoutes, 0);
  });

  test('fills the public demo account', () {
    controller.errorMessage.value = 'Enter both username and password.';
    controller.fillDemoAccount();

    expect(controller.usernameController.text, DemoAccount.username);
    expect(controller.passwordController.text, DemoAccount.password);
    expect(controller.errorMessage.value, isNull);
  });
}
