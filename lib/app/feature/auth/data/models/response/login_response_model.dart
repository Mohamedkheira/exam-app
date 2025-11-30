import 'package:exam_app/app/feature/auth/data/models/response/user_dto.dart';
import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final String token;
  final UserDto user;

  LoginResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginEntity toEntity() {
    return LoginEntity(message: message, accessToken: token);
  }
}
