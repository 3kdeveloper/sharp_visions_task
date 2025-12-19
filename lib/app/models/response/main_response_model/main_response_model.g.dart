// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) => MainResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  redirect: json['redirect'] as String?,
  token: json['token'] as String?,
  data: const ResponseDataConverter().fromJson(json['data']),
  pagination: json['pagination'] == null
      ? null
      : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'redirect': instance.redirect,
      'token': instance.token,
      'data': const ResponseDataConverter().toJson(instance.data),
      'pagination': instance.pagination,
    };
