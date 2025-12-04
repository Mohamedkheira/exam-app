// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginApiResponse _$AuthLoginApiResponseFromJson(
  Map<String, dynamic> json,
) => AuthLoginApiResponse(
  message: json['message'] as String?,
  token: json['token'] as String?,
  userDto: json['user'] == null
      ? null
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthLoginApiResponseToJson(
  AuthLoginApiResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.userDto,
};
