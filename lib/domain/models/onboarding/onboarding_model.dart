import 'package:news/domain/models/image/image_model.dart';
import 'dart:convert';

final class OnboardingModel {
  final String title;
  final String description;
  final ImageModel? image; 

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  String toString() =>
      'OnboardingModel(title: $title, description: $description, image: $image)';

  OnboardingModel copyWith({
    String? title,
    String? description,
    ImageModel? image,
  }) {
    return OnboardingModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      title: map['title']['value'] as String,
      description: map['description']['value'] as String,
      image: map['image']['value'] != null
          ? ImageModel.fromMap(map['image']['value'] as Map<String, dynamic>)
          : null,
    );
  }

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant OnboardingModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ image.hashCode;
}
