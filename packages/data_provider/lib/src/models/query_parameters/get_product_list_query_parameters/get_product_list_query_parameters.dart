// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'get_product_list_query_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProductListQueryParameters {
  @JsonKey(name: 'category', includeIfNull: false)
  final int? categoryId;

  @JsonKey(name: 'brands', includeIfNull: false)
  final int? brandId;

  @JsonKey(includeIfNull: false)
  final int? page;

  @JsonKey(includeIfNull: false)
  final int? limit;

  @JsonKey(name: 'keyword', includeIfNull: false)
  final String? search;

  GetProductListQueryParameters({
    this.categoryId,
    this.brandId,
    this.page,
    this.limit,
    this.search,
  });

  Map<String, dynamic> toJson() => _$GetProductListQueryParametersToJson(this);
  factory GetProductListQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProductListQueryParametersFromJson(json);
}
