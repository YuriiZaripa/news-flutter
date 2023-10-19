import 'package:news/domain/models/article/author_model.dart';
import 'package:news/domain/models/image/image_model.dart';
import 'package:news/presentation/utils/data_converter.dart';

final class ArticleModel {
  final int id;
  final String title;
  final String? shortContent;
  final ImageModel image;
  final DateTime dateCreated;
  final Author author;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.shortContent,
    required this.image,
    required this.dateCreated,
    required this.author,
  });

  String getFormattedDate() {
    DateConverter converter = DateConverter();
    return converter.getLocaleDate(dateCreated);
  }

  ArticleModel copyWith(
      {int? id,
      String? title,
      String? shortContent,
      ImageModel? image,
      DateTime? dateCreated,
      Author? author}) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      shortContent: shortContent ?? this.shortContent,
      image: image ?? this.image,
      dateCreated: dateCreated ?? this.dateCreated,
      author: this.author,
    );
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as int,
      title: json['title'] as String,
      shortContent: json['short_content'] as String?,
      image: ImageModel.fromMap(json['image'] as Map<String, dynamic>),
      dateCreated: DateTime.parse(json['date_created']),
      author: Author.fromMap(json['author'] as Map<String, dynamic>),
    );
  }
}
