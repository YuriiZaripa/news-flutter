import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dependency_injection.dart' as di;
import 'package:news/presentation/cubit/main_cubit.dart';
import 'package:news/presentation/routes/router.dart';

void main() {
  di.setup();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  final MainCubit mainCubit = di.getIt.get();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainCubit,
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
        ),
    );
  }
}
