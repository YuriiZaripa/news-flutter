import 'package:news/data/remote_storage/article_service.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/domain/repositories/i_article_repository.dart';

final class ArticleRepository implements IArticleRepository {
  final ArticleService service;

  ArticleRepository(
    this.service,
  );

  @override
  Future<({bool isSuccess, List<ArticleModel> articles, String? error})>
      getArticles() async {
    return await service.getArticles();
  }
}
