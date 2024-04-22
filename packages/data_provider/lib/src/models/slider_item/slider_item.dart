// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'slider_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SliderItem {
  SliderItem({
    this.id,
    this.image,
  });

  final int? id;

  final String? image;

  Map<String, dynamic> toJson() => _$SliderItemToJson(this);
  factory SliderItem.fromJson(Map<String, dynamic> json) => _$SliderItemFromJson(json);
}
