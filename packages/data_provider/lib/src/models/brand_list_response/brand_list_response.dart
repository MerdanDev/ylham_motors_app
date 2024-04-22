// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BrandListResponse {
  BrandListResponse({
    this.data,
  });

  final List<BrandItem>? data;

  Map<String, dynamic> toJson() => _$BrandListResponseToJson(this);
  factory BrandListResponse.fromJson(Map<String, dynamic> json) => _$BrandListResponseFromJson(json);
}
