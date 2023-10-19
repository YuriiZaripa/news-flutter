import 'dart:convert';

import 'package:html/parser.dart';
import 'package:news/domain/models/article/author_model.dart';
import 'package:news/domain/models/image/image_model.dart';
import 'package:news/presentation/utils/data_converter.dart';

final class ArticleModel  {
  final int id;
  final String title;
  final String? shortContent;
  final ImageModel image;
  final String dateCreated; //TODO если это дата, то лучше тут писать тип DateTime  и менять при парсинге в фром джейсон
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
    final dateString = converter.convertStringToDateTime(dateCreated);
    return converter.getLocaleDate(dateString);
  }

  String getParsedShortContent() {
    return parse(shortContent).documentElement!.text;
  }

  ArticleModel copyWith({
    int? id,
    String? title,
    String? shortContent,
    ImageModel? image,
    String? dateCreated,
    Author? author
  }) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      shortContent: shortContent ?? this.shortContent,
      image: image ?? this.image,
      dateCreated: dateCreated ?? this.dateCreated,
      author: this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'short_content': shortContent,
      'image': image.toMap(),
      'date_created': dateCreated,
      'author': author.toMap()
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      title: map['title'] as String,
      shortContent: map['short_content'] as String?,
      image: ImageModel.fromMap(map['image'] as Map<String,dynamic>),
      dateCreated: map['date_created'] as String,
      author: Author.fromMap(map['author'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}