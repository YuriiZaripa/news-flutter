import 'package:news/domain/models/article/article_model.dart';
import 'package:news/domain/repositories/i_article_repository.dart';

abstract interface class IGetArticlesUsecase {
  Future<({bool isSuccess, List<ArticleModel> articles, String? error})> call();
}

final class GetArticlesUsecase implements IGetArticlesUsecase {
  final IArticleRepository repository;

  GetArticlesUsecase(this.repository);

  @override
  Future<({bool isSuccess, List<ArticleModel> articles, String? error})>
      call() async {
    return await repository.getArticles();
  }
}
