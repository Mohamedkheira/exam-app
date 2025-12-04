import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String message;
  final String token;
  final User user;

  SignUpResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class User {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  @JsonKey(name: '_id')
  final String id;
  final String createdAt;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.id,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}