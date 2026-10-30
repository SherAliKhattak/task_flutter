import 'package:flutter_assignment_upwork/core/constants/demo_account.dart';
import 'package:flutter_assignment_upwork/features/auth/domain/usecases/login.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../support/fakes.dart';

void main() {
  setUp(() => Get.testMode = true);

  tearDown(Get.reset);

  testWidgets('explains the demo account and validates empty fields', (
    tester,
  ) async {
    Get.put(
      LoginController(
        login: Login(FakeAuthRepository()),
        navigator: RecordingNavigator(),
      ),
    );

    await tester.pumpWidget(const GetMaterialApp(home: LoginPage()));

    expect(find.textContaining(DemoAccount.username), findsWidgets);
    expect(find.textContaining(DemoAccount.password), findsWidgets);

    await tester.ensureVisible(find.byKey(LoginPage.signInButtonKey));
    await tester.tap(find.byKey(LoginPage.signInButtonKey));
    await tester.pump();

    expect(find.text('Enter both username and password.'), findsOneWidget);
  });

  testWidgets('use demo account fills the form', (tester) async {
    Get.put(
      LoginController(
        login: Login(FakeAuthRepository()),
        navigator: RecordingNavigator(),
      ),
    );

    await tester.pumpWidget(const GetMaterialApp(home: LoginPage()));
    await tester.ensureVisible(find.byKey(LoginPage.demoAccountButtonKey));
    await tester.tap(find.byKey(LoginPage.demoAccountButtonKey));
    await tester.pump();

    final controller = Get.find<LoginController>();
    expect(controller.usernameController.text, DemoAccount.username);
    expect(controller.passwordController.text, DemoAccount.password);
  });
}
