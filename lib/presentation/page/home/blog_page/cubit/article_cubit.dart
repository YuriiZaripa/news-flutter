import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/enums/enum.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/domain/usecases/article/get_articles_usecase.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final IGetArticlesUsecase _getArticlesUseCase;

  ArticleCubit(
    this._getArticlesUseCase,
  ) : super(const ArticleState());

  Future getAllArticles() async {
    final result = await _getArticlesUseCase();
    //TODO аналогично нету обработки ошибки с бека и лоадера
    emit(
      ArticleState(
        status: BlocStatus.loaded,
        allArticles: result.articles,
      ),
    );
  }
}
