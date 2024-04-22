// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItem {
  ProductItem({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.count,
    this.rating,
    this.discount,
    this.discountedPrice,
    this.action,
    this.actionText,
    this.proportionalPrice,
  });

  final int? id;

  final String? name;

  final String? description;

  final String? image;

  final String? price;

  final int? count;

  final String? rating;

  final double? discount;

  @JsonKey(name: 'discounted_price')
  final dynamic discountedPrice;

  final bool? action;

  @JsonKey(name: 'action_text')
  final String? actionText;

  @JsonKey(name: 'proportional_price')
  final dynamic proportionalPrice;

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
}
