import 'package:news/domain/models/article/article_model.dart';

abstract interface class IArticleRepository {
  Future<({bool isSuccess, List<ArticleModel> articles, String? error})>
      getArticles();
}
