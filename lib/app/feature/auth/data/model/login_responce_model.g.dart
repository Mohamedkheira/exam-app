// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponceModel _$LoginResponceModelFromJson(Map<String, dynamic> json) =>
    LoginResponceModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponceModelToJson(LoginResponceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
