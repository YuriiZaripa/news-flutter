// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BlogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogPage(),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainWrapperPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    OneArticleRoute.name: (routeData) {
      final args = routeData.argsAs<OneArticleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OneArticlePage(
          key: args.key,
          article: args.article,
        ),
      );
    },
  };
}

/// generated route for
/// [BlogPage]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainWrapperPage]
class MainWrapperRoute extends PageRouteInfo<void> {
  const MainWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OneArticlePage]
class OneArticleRoute extends PageRouteInfo<OneArticleRouteArgs> {
  OneArticleRoute({
    Key? key,
    required ArticleModel article,
    List<PageRouteInfo>? children,
  }) : super(
          OneArticleRoute.name,
          args: OneArticleRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'OneArticleRoute';

  static const PageInfo<OneArticleRouteArgs> page =
      PageInfo<OneArticleRouteArgs>(name);
}

class OneArticleRouteArgs {
  const OneArticleRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final ArticleModel article;

  @override
  String toString() {
    return 'OneArticleRouteArgs{key: $key, article: $article}';
  }
}
