// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBody _$UserBodyFromJson(Map<String, dynamic> json) => UserBody(
  email: json['email'] as String,
  password: json['password'] as String,
  deviceToken: json['device_token'] as String,
  language: json['language'] as String,
);

Map<String, dynamic> _$UserBodyToJson(UserBody instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'device_token': instance.deviceToken,
  'language': instance.language,
};
