// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'cart_update_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class CartUpdateRequestBody {
  @JsonKey(name: 'product_id')
  final int productId;

  final int quantity;

  CartUpdateRequestBody({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$CartUpdateRequestBodyToJson(this);
  factory CartUpdateRequestBody.fromJson(Map<String, dynamic> json) => _$CartUpdateRequestBodyFromJson(json);
}
