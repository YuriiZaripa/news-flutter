import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/enums/enuma.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/domain/usecases/article/get_articles_usecase.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final IGetArticlesUsecase _getArticlesUseCase;

  ArticleCubit(
    this._getArticlesUseCase,
  ) : super(const ArticleState());

  Future init() async {
    emit(_loadingState());
    await _getAllArticles();
  }

  Future loadAllArticles() async {
    await _getAllArticles();
  }

  Future _getAllArticles() async {
    final result = await _getArticlesUseCase();

    if (result.isSuccess) {
      emit(
        ArticleState(
          status: BlocStatus.loaded,
          allArticles: result.articles,
        ),
      );
    } else {
      emit(_onError(result.error));
    }
  }

  ArticleState _loadingState() => state.copyWith(
        status: BlocStatus.loading,
      );

  ArticleState _onError(String? error) {
    return state.copyWith(
      status: BlocStatus.error,
      error: error,
    );
  }
}
