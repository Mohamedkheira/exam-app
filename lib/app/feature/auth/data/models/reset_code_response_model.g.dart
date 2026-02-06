// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordResponseModel(
  message: json['message'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
  ForgetPasswordResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'code': instance.code};
