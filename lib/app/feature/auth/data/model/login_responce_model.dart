// To parse this JSON data, do
//
//     final loginResponceModel = loginResponceModelFromJson(jsonString);

import 'package:exam_app/app/feature/auth/data/model/user_responce_model.dart';
import 'package:exam_app/app/feature/auth/domain/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_responce_model.g.dart';

LoginResponceModel loginResponceModelFromJson(String str) =>
    LoginResponceModel.fromJson(json.decode(str));

String loginResponceModelToJson(LoginResponceModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LoginResponceModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  User? user;

  LoginResponceModel({this.message, this.token, this.user});

  factory LoginResponceModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponceModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponceModelToJson(this);


  UserModel toDomain() => UserModel(token: token, user: user,);
}
