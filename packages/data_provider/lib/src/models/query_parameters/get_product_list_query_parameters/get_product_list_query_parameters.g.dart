// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_list_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductListQueryParameters _$GetProductListQueryParametersFromJson(
        Map<String, dynamic> json) =>
    GetProductListQueryParameters(
      categoryId: json['category'] as int?,
      brandId: json['brands'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      search: json['keyword'] as String?,
    );

Map<String, dynamic> _$GetProductListQueryParametersToJson(
    GetProductListQueryParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', instance.categoryId);
  writeNotNull('brands', instance.brandId);
  writeNotNull('page', instance.page);
  writeNotNull('limit', instance.limit);
  writeNotNull('keyword', instance.search);
  return val;
}
