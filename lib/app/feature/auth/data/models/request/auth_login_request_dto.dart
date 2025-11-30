import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request_dto.g.dart';

@JsonSerializable()
class AuthLoginRequestDto {
  final String email;
  final String password;

  AuthLoginRequestDto({required this.email, required this.password});

  factory AuthLoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginRequestDtoToJson(this);
}
