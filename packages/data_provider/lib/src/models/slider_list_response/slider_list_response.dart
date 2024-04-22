// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slider_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SliderListResponse {
  SliderListResponse({
    this.data,
  });

  final List<SliderItem>? data;

  Map<String, dynamic> toJson() => _$SliderListResponseToJson(this);
  factory SliderListResponse.fromJson(Map<String, dynamic> json) => _$SliderListResponseFromJson(json);
}
