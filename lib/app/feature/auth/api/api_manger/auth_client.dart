import 'package:dio/dio.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/app_endpoint_strings.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl:AppEndpointString.baseUrl)
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;

  @POST(AppEndpointString.sendEmail)
  Future<ForgetPasswordEmailResponseModel> sendEmail(@Field("email") String email);
}