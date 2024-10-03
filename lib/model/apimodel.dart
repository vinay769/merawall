// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';

class Apimodel {
  final String id;
  final String color;
  final Map<String, String> urls; // Ensure consistent type for URLs

  Apimodel({
    required this.id,
    required this.color,
    required this.urls,
  });

  Apimodel copyWith({
    String? id,
    String? color,
    Map<String, String>? urls, // Maintain consistent type
  }) {
    return Apimodel(
      id: id ?? this.id,
      color: color ?? this.color,
      urls: urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'urls': urls, // Cast directly for clarity
    };
  }

  factory Apimodel.fromMap(Map<String, dynamic> map) {
    return Apimodel(
      id: map['id'] as String,
      color: map['color'] as String,
      urls: (map['urls'] as Map<String, dynamic>).cast<String, String>(), // Cast to correct type
    );
  }

  String toJson() => json.encode(toMap());

  factory Apimodel.fromJson(String source) => Apimodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Apimodel(id: $id, color: $color, urls: $urls)';

  @override
  bool operator ==(covariant Apimodel other) {
    if (identical(this, other)) return true;

    final mapEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.color == color &&
        mapEquals(other.urls, urls);
  }

  @override
  int get hashCode => id.hashCode ^ color.hashCode ^ urls.hashCode;
}