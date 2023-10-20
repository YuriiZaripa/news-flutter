import 'package:get_it/get_it.dart';
import 'package:news/data/remote_storage/article_service.dart';
import 'package:news/data/remote_storage/onboarding_service.dart';
import 'package:news/data/repository/article_repository.dart';
import 'package:news/data/repository/onboarding_repository.dart';
import 'package:news/domain/repository/i_article_repository.dart';
import 'package:news/domain/repository/i_onbording_repository.dart';
import 'package:news/domain/usecases/article/get_articles_usecase.dart';
import 'package:news/domain/usecases/onboarding/get_onboarding_entities_usecase.dart';
import 'package:news/presentation/cubit/main_cubit.dart';
import 'package:news/presentation/page/auth/onboarding_page/cubit/onboarding_cubit.dart';
import 'package:news/presentation/page/home/blog_page/cubit/article_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  // SERVICES
  getIt
    ..registerLazySingleton<OnboardingService>(
      () => OnboardingService(),
    )
    ..registerLazySingleton<ArticleService>(
      () => ArticleService(),
    )

    // REPOSITORIES
    ..registerLazySingleton<IOnboardingRepository>(
      () => OnboardingRepository(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IArticleRepository>(
      () => ArticleRepository(
        getIt.get(),
      ),
    )

    // USE CASES
    ..registerLazySingleton<IGetOnboardingEntitiesUsecase>(
      () => GetOnboardingEntitiesUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IGetArticlesUsecase>(
      () => GetArticlesUsecase(
        getIt.get(),
      ),
    )

    // BLOC
    ..registerLazySingleton<MainCubit>(
      () => MainCubit(),
    )
    ..registerLazySingleton<OnboardingCubit>(
      () => OnboardingCubit(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<ArticleCubit>(
      () => ArticleCubit(
        getIt.get(),
      ),
    );
}
