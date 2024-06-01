// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItem extends Equatable {
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

  final bool? isFavorite;

  const ProductItem({
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
    this.isFavorite,
  });

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      image,
      price,
      count,
      rating,
      discount,
      discountedPrice,
      action,
      actionText,
      proportionalPrice,
      isFavorite,
    ];
  }

  ProductItem copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? price,
    int? count,
    String? rating,
    double? discount,
    dynamic discountedPrice,
    bool? action,
    String? actionText,
    dynamic proportionalPrice,
    bool? isFavorite,
  }) {
    return ProductItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      count: count ?? this.count,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      action: action ?? this.action,
      actionText: actionText ?? this.actionText,
      proportionalPrice: proportionalPrice ?? this.proportionalPrice,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
