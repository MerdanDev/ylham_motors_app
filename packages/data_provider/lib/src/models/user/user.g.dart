// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      phone: json['phone'] as String?,
      otp: json['otp'] as String?,
      apiToken: json['api_token'] as String?,
      type: json['type'] as String?,
      loginAttemptedAt: json['login_attempted_at'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'username': instance.username,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'phone': instance.phone,
      'otp': instance.otp,
      'api_token': instance.apiToken,
      'type': instance.type,
      'login_attempted_at': instance.loginAttemptedAt,
      'image': instance.image,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };
