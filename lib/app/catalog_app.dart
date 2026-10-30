import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/app/bindings/initial_binding.dart';
import 'package:flutter_assignment_upwork/app/routes/app_pages.dart';
import 'package:flutter_assignment_upwork/app/theme/app_theme.dart';

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marlow',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: initialRoute,
      getPages: AppPages.pages,
    );
  }
}
