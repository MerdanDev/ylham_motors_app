// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterRequestBody {
  final String? name;

  final String? surname;

  final String? email;

  final String? phone;

  RegisterRequestBody({
    this.name,
    this.surname,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) => _$RegisterRequestBodyFromJson(json);
}
