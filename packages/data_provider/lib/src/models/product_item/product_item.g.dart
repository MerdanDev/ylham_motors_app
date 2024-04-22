// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      count: json['count'] as int?,
      rating: json['rating'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      discountedPrice: json['discounted_price'],
      action: json['action'] as bool?,
      actionText: json['action_text'] as String?,
      proportionalPrice: json['proportional_price'],
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'count': instance.count,
      'rating': instance.rating,
      'discount': instance.discount,
      'discounted_price': instance.discountedPrice,
      'action': instance.action,
      'action_text': instance.actionText,
      'proportional_price': instance.proportionalPrice,
    };
