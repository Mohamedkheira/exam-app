import 'package:json_annotation/json_annotation.dart';

part 'forget_password_email_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordEmailResponseModel {
  final String? message;
  final String? info;

  ForgetPasswordEmailResponseModel(
      {
        required this.message,
        required this.info,
});

  factory ForgetPasswordEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordEmailResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ForgetPasswordEmailResponseModelToJson(this);

}