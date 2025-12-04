// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDTO _$SignUpRequestDTOFromJson(Map<String, dynamic> json) =>
    SignUpRequestDTO(
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
    );

Map<String, dynamic> _$SignUpRequestDTOToJson(SignUpRequestDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'rePassword': instance.rePassword,
    };
