// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      data: json['data'] == null
          ? null
          : Cart.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      totalPrice: json['total_price'] as String?,
      quantity: json['quantity'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'total_price': instance.totalPrice,
      'quantity': instance.quantity,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      totalPrice: json['total_price'] as String?,
      quantity: json['quantity'] as int?,
      product: json['product'] == null
          ? null
          : ProductItem.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'total_price': instance.totalPrice,
      'quantity': instance.quantity,
      'product': instance.product?.toJson(),
    };
