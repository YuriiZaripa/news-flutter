import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/presentation/page/auth/onboarding_page/onbording_page.dart';
import 'package:news/presentation/page/home/blog_page/blog_page.dart';
import 'package:news/presentation/page/home/blog_page/one_article_page.dart';
import 'package:news/presentation/page/main_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainWrapperRoute.page,
      initial: true,
    ),
    AutoRoute(page: OnboardingRoute.page,),
    AutoRoute(page: BlogRoute.page,),
    AutoRoute(page: OneArticleRoute.page,),
  ];
}
