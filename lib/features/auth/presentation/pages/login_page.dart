import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/constants/demo_account.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';
import 'package:flutter_assignment_upwork/core/widgets/shimmer.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_assignment_upwork/features/auth/presentation/widgets/marlow_mark.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const usernameFieldKey = Key('username_field');
  static const passwordFieldKey = Key('password_field');
  static const signInButtonKey = Key('sign_in_button');
  static const demoAccountButtonKey = Key('demo_account_button');
  static const errorTextKey = Key('login_error');

  ThemeData get theme => controller.theme;

  ColorScheme get scheme => controller.scheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(28.w, 20.h, 28.w, 28.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 460.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MarlowMark(),
                  SizedBox(height: 48.h),
                  Text(
                    'Sign the\nbook.',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 48.h,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Staff entrance for the product floor.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  CustomTextField(
                    fieldKey: usernameFieldKey,
                    label: 'Username',
                    controller: controller.usernameController,
                    hintText: 'emilys',
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    enableSuggestions: false,
                    autofillHints: const [AutofillHints.username],
                    onSubmitted: (_) => controller.passwordFocus.requestFocus(),
                  ),
                  SizedBox(height: 22.h),
                  Obx(
                    () => CustomTextField(
                      fieldKey: passwordFieldKey,
                      label: 'Password',
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocus,
                      obscureText: controller.passwordObscured,
                      hintText: '*',
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      suffix: IconButton(
                        tooltip: controller.passwordObscured
                            ? 'Show password'
                            : 'Hide password',
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.passwordObscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20.w,
                        ),
                      ),
                      onSubmitted: (_) => controller.submit(),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Obx(() {
                    if (controller.message == null) {
                      return SizedBox(height: 8.h);
                    }
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        controller.message!,
                        key: errorTextKey,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.error,
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FilledButton(
                          key: signInButtonKey,
                          onPressed: controller.loading
                              ? () {}
                              : controller.submit,
                          child: controller.loading
                              ? Shimmer(
                                  baseColor: scheme.onPrimary.withValues(
                                    alpha: 0.28,
                                  ),
                                  highlightColor: scheme.onPrimary,
                                  child: ShimmerBlock(width: 72.w, height: 8.h),
                                )
                              : const Text('ENTER'),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            key: demoAccountButtonKey,
                            onPressed: controller.loading
                                ? null
                                : controller.fillDemoAccount,
                            child: const Text('Use demo account'),
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 28.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 14.h),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: scheme.outline)),
                    ),
                    child: Text(
                      'Desk copy  ${DemoAccount.username}  /  ${DemoAccount.password}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        letterSpacing: 0.3,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
