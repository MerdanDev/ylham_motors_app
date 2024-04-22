// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItem {
  CategoryItem({
    this.id,
    this.name,
    this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);
}
