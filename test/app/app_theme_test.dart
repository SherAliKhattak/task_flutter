import 'package:flutter_assignment_upwork/app/theme/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('app theme does not need a Get navigator', () {
    expect(AppTheme.light, isNotNull);
    expect(AppTheme.dark, isNotNull);
  });
}
