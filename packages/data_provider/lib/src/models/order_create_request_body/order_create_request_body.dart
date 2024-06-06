// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'order_create_request_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderCreateRequestBody {
  final String? fullName;
  final String? phone;
  final String? address;
  final String? note;
  final String? paymentMethod;
  final String? deliveryType;

  @JsonKey(defaultValue: '1')
  final String? dateDelivery;

  @JsonKey(defaultValue: '11:00-12:00')
  final String? deliveryTime;

  OrderCreateRequestBody({
    this.fullName,
    this.phone,
    this.address,
    this.note,
    this.paymentMethod,
    this.deliveryType,
    this.dateDelivery,
    this.deliveryTime,
  });

  Map<String, dynamic> toJson() => _$OrderCreateRequestBodyToJson(this);
  factory OrderCreateRequestBody.fromJson(Map<String, dynamic> json) => _$OrderCreateRequestBodyFromJson(json);
}
