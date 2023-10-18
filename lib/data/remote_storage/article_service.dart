import 'package:dio/dio.dart';
import 'package:news/constants/url_constants.dart';
import 'package:news/data/network_service/api_service.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/presentation/utils/data_converter.dart';

final class ArticleService {
  Future<({bool isSuccess, List<ArticleModel> articles, String? error})>
      getArticles() async {
    try {
      Response? response = await get(UrlConstants.apiArticles);
      final map = response!.data as Map<String, dynamic>;
      final data = map["data"] as List;
      final articles = data
          .map((e) => ArticleModel.fromMap(e as Map<String, dynamic>))
          .toList();

      DateConverter converter = DateConverter();
      articles.sort(((a, b) => converter
          .convertStringToDateTime(a.dateCreated)
          .compareTo(converter.convertStringToDateTime(b.dateCreated))));
      return (
        isSuccess: true,
        articles: articles.reversed.toList(),
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        articles: <ArticleModel>[],
        error: result['error']['message'].toString(),
      );
    }
  }
}
