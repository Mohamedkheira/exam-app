// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginAPiRequest _$AuthLoginAPiRequestFromJson(Map<String, dynamic> json) =>
    AuthLoginAPiRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthLoginAPiRequestToJson(
  AuthLoginAPiRequest instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
