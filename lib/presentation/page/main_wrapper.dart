import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dependency_injection.dart' as di;
import 'package:news/domain/enums/enuma.dart';
import 'package:news/presentation/cubit/main_cubit.dart';
import 'package:news/presentation/routes/router.dart';

@RoutePage<dynamic>()
class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({Key? key}) : super(key: key);

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  final MainCubit mainCubit = di.getIt.get();

  @override
  void initState() {
    super.initState();
    mainCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      bloc: mainCubit,
      listener: (context, state) {
        if (state.status == BlocStatus.loaded && state.isFirstLaunch) {
          context.replaceRoute(const OnboardingRoute());
        } else if (state.status == BlocStatus.loaded && !state.isFirstLaunch) {
          context.replaceRoute(const BlogRoute());
        }
      },
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


































// void retryInit() {
  //   mainCubit.add(const InitialEvent());
  // }


        // return BlocBuilder<MainCubit, MainState>(
        //   builder: (_, state) {
        //     if (state.status == BlocStatus.error) {
        //         return const Scaffold(
        //           body: Center(
        //             child: Text('Error'),
        //           ),
        //         );
        //     } else {
        //       PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        //         version = '${packageInfo.version} ${packageInfo.buildNumber}';
        //       });
        //       return Scaffold(
        //         body: SplashWithVersion(
        //           version: version,
        //         ),
        //       );
        //     }
        //   },
        // );
//       },
//     );
//   }
// }