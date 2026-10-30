import 'package:flutter_assignment_upwork/app/bootstrap.dart';
import 'package:flutter_assignment_upwork/app/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fakes.dart';

void main() {
  test('opens the catalog when a token is stored', () async {
    final route = await resolveInitialRoute(
      storage: FakeAuthLocal()..accessToken = 'token',
    );

    expect(route, AppRoutes.products);
  });

  test('opens login when there is no token', () async {
    final route = await resolveInitialRoute(storage: FakeAuthLocal());

    expect(route, AppRoutes.login);
  });

  test('opens login when secure storage cannot be read', () async {
    final route = await resolveInitialRoute(
      storage: FakeAuthLocal()..error = StateError('keychain unavailable'),
    );

    expect(route, AppRoutes.login);
  });
}
