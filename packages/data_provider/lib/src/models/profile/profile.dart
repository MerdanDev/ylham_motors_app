// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  Profile({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.username,
    this.createdAt,
    this.phone,
    this.image,
  });

  final int? id;

  final String? name;

  final String? surname;

  final String? email;

  final String? username;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  final String? phone;

  final String? image;

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
