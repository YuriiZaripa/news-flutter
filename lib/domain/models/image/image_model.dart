import 'dart:convert';

final class ImageModel {
  final String link;

  const ImageModel({
    required this.link,
  });

  ImageModel copyWith({
    String? link,
  }) {
    return ImageModel(
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ImageModel(link: $link)'; 
  }

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;

    return other.link == link;
  }

  @override
  int get hashCode {
    return link.hashCode;
  }
}