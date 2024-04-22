// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_verify_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthVerifyRequestBody _$AuthVerifyRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AuthVerifyRequestBody(
      phone: json['phone'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$AuthVerifyRequestBodyToJson(
        AuthVerifyRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
    };
