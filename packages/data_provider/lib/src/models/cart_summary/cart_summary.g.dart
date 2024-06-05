// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartSummaryResponse _$CartSummaryResponseFromJson(Map<String, dynamic> json) =>
    CartSummaryResponse(
      paymentMethods: (json['payment_method'] as List<dynamic>?)
          ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryTypes: (json['delivery_type'] as List<dynamic>?)
          ?.map((e) => DeliveryType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartSummaryResponseToJson(
        CartSummaryResponse instance) =>
    <String, dynamic>{
      'payment_method':
          instance.paymentMethods?.map((e) => e.toJson()).toList(),
      'delivery_type': instance.deliveryTypes?.map((e) => e.toJson()).toList(),
    };

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      key: json['key'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'description': instance.description,
    };

DeliveryType _$DeliveryTypeFromJson(Map<String, dynamic> json) => DeliveryType(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeliveryTypeToJson(DeliveryType instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
