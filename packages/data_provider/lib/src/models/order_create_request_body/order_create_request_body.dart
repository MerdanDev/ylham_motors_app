// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'order_create_request_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderCreateRequestBody {
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? phone;
  final String? address;
  final String? note;
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @JsonKey(name: 'delivery_type')
  final String? deliveryType;

  // @JsonKey(defaultValue: '1', name: 'date_delivery')
  // final String? dateDelivery;

  // @JsonKey(defaultValue: '11:00-12:00', name: 'deliver_time')
  // final String? deliveryTime;

  OrderCreateRequestBody({
    this.fullName,
    this.phone,
    this.address,
    this.note,
    this.paymentMethod,
    this.deliveryType,
    // this.dateDelivery,
    // this.deliveryTime,
  });

  Map<String, dynamic> toJson() => _$OrderCreateRequestBodyToJson(this);
  factory OrderCreateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateRequestBodyFromJson(json);
}
