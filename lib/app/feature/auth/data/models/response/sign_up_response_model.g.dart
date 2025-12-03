// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      message: json['message'] as String,
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
  SignUpResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  username: json['username'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  role: json['role'] as String,
  isVerified: json['isVerified'] as bool,
  id: json['_id'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'isVerified': instance.isVerified,
  '_id': instance.id,
  'createdAt': instance.createdAt,
};
