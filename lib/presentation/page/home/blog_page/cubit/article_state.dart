part of 'article_cubit.dart';

class ArticleState extends Equatable {
  const ArticleState({
    this.status = BlocStatus.loading,
    this.allArticles = const [],
    this.error,
  });

  final BlocStatus status;
  final List<ArticleModel> allArticles;
  final String? error;

  ArticleState copyWith({
    BlocStatus? status,
    List<ArticleModel>? allArticles,
    String? error,
  }) {
    return ArticleState(
      status: status ?? this.status,
      allArticles: allArticles ?? this.allArticles,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allArticles,
        error,
      ];
}
