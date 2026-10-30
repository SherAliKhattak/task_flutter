import 'package:flutter_assignment_upwork/app/routes/app_routes.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_assignment_upwork/features/auth/data/datasources/auth_local_data_source_impl.dart';

/// Picks the first route from the securely stored session.
Future<String> resolveInitialRoute({AuthLocalDataSource? storage}) async {
  final local = storage ?? AuthLocalDataSourceImpl();
  try {
    final hasSession = await local.hasSession();
    return hasSession ? AppRoutes.products : AppRoutes.login;
  } on Object {
    return AppRoutes.login;
  }
}
