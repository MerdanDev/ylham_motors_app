// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryListResponse {
  CategoryListResponse({
    this.data,
  });

  final List<CategoryItem>? data;

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
  factory CategoryListResponse.fromJson(Map<String, dynamic> json) => _$CategoryListResponseFromJson(json);
}
