// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginRequestDto _$AuthLoginRequestDtoFromJson(Map<String, dynamic> json) =>
    AuthLoginRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthLoginRequestDtoToJson(
  AuthLoginRequestDto instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
