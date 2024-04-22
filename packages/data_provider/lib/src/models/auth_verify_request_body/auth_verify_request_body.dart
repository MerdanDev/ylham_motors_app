// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'auth_verify_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthVerifyRequestBody {
  final String phone;

  final String otp;

  AuthVerifyRequestBody({
    required this.phone,
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$AuthVerifyRequestBodyToJson(this);
  factory AuthVerifyRequestBody.fromJson(Map<String, dynamic> json) => _$AuthVerifyRequestBodyFromJson(json);
}
