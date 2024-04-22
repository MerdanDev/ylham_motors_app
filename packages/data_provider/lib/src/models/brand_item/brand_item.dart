// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'brand_item.g.dart';

@JsonSerializable(explicitToJson: true)
class BrandItem {
  BrandItem({
    this.id,
    this.name,
    this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  Map<String, dynamic> toJson() => _$BrandItemToJson(this);
  factory BrandItem.fromJson(Map<String, dynamic> json) => _$BrandItemFromJson(json);
}
