// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class User {
  final int? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? username;
  final String? createdAt;
  final String? updatedAt;
  final String? phone;
  final String? otp;
  final String? apiToken;
  final String? type;
  final String? loginAttemptedAt;
  final String? image;

  User({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.otp,
    this.apiToken,
    this.type,
    this.loginAttemptedAt,
    this.image,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UserResponse {
  final User? data;

  UserResponse({
    this.data,
  });

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
