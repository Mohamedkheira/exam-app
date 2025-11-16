import 'package:json_annotation/json_annotation.dart';

part 'reset_code_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  final String message;
  final String code;

  ForgetPasswordResponseModel(
      {
        required this.message,
        required this.code,
      });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ForgetPasswordResponseModelToJson(this);

}