import 'package:json_annotation/json_annotation.dart';

part 'auth_login_api_request.g.dart';

@JsonSerializable()
class AuthLoginAPiRequest {
  final String email;
  final String password;

  const AuthLoginAPiRequest({required this.email, required this.password});

  factory AuthLoginAPiRequest.fromJson(Map<String, dynamic> json) {
    return _$AuthLoginAPiRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthLoginAPiRequestToJson(this);
}
