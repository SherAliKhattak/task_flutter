import 'package:flutter/widgets.dart';
import 'package:flutter_assignment_upwork/app/bootstrap.dart';
import 'package:flutter_assignment_upwork/app/catalog_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await resolveInitialRoute();
  runApp(CatalogApp(initialRoute: initialRoute));
}
