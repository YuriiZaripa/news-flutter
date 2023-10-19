import 'package:flutter/material.dart';
import 'package:news/dependency_injection.dart' as di;
import 'package:news/presentation/routes/router.dart';

void main() {
  di.setup();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
