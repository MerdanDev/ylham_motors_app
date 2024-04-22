// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandListResponse _$BrandListResponseFromJson(Map<String, dynamic> json) =>
    BrandListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BrandItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandListResponseToJson(BrandListResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
