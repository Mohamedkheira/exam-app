import 'package:dio/dio.dart';
import 'package:exam_app/app/feature/auth/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/app/feature/auth/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/app_endpoint_strings.dart';
import '../../data/models/change_password_request_model.dart';
import '../../data/models/reset_code_response_model.dart';

part 'auth_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndpointString.sendEmail)
  Future<ForgetPasswordEmailResponseModel> sendEmail(
    @Field("email") String email,
  );

  @POST(AppEndpointString.resetCode)
  Future<ForgetPasswordResponseModel> verifyResetCode(
    @Field("resetCode") String resetCode,
  );

  @PATCH(AppEndpointString.changePassword)
  Future<ForgetPasswordResponseModel> changePassword(
    @Body() ChangePasswordRequestModel resetCode,
  );
  @POST(AppEndpointString.login)
  Future<AuthLoginRequestDto> login(
    @Body() AuthLoginRequestDto loginRequestModel,
  );
}
