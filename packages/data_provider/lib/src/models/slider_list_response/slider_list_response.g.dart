// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderListResponse _$SliderListResponseFromJson(Map<String, dynamic> json) =>
    SliderListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SliderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderListResponseToJson(SliderListResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
