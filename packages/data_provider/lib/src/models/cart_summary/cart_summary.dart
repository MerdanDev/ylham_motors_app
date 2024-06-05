// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'cart_summary.g.dart';

@JsonSerializable(explicitToJson: true)
class CartSummaryResponse {
  @JsonKey(name: 'payment_method')
  final List<PaymentMethod>? paymentMethods;

  @JsonKey(name: 'delivery_type')
  final List<DeliveryType>? deliveryTypes;

  CartSummaryResponse({
    this.paymentMethods,
    this.deliveryTypes,
  });

  Map<String, dynamic> toJson() => _$CartSummaryResponseToJson(this);
  factory CartSummaryResponse.fromJson(Map<String, dynamic> json) => _$CartSummaryResponseFromJson(json);
}

@JsonSerializable()
class PaymentMethod {
  final String? key;
  final String? name;
  final String? description;

  PaymentMethod({
    this.key,
    this.name,
    this.description,
  });

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
}

@JsonSerializable()
class DeliveryType {
  final String? key;
  final String? name;

  DeliveryType({
    this.key,
    this.name,
  });

  Map<String, dynamic> toJson() => _$DeliveryTypeToJson(this);
  factory DeliveryType.fromJson(Map<String, dynamic> json) => _$DeliveryTypeFromJson(json);
}
