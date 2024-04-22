// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductListResponse {
  ProductListResponse({
    this.currentPage,
    this.data,
    this.from,
    this.to,
    this.perPage,
  });

  @JsonKey(name: 'current_page')
  final int? currentPage;

  final List<ProductItem>? data;

  final int? from;
  final int? to;

  @JsonKey(name: 'per_page')
  final dynamic perPage;

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
  factory ProductListResponse.fromJson(Map<String, dynamic> json) => _$ProductListResponseFromJson(json);
}
