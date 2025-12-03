import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/config/error_handler/error_handler.dart';
import 'package:exam_app/app/feature/auth/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/app/feature/auth/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/reset_code_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasources/auth_datasource_contract.dart';
import '../../data/models/response/login_response_model.dart';
import '../api_manger/auth_client.dart';
import 'package:dio/dio.dart';

@Injectable(as: AuthDataSourceContract)
class AuthDataSourceImpl implements AuthDataSourceContract {
  AuthDataSourceImpl(this.authApiClient);
  AuthApiClient authApiClient;
  @override
  Future<ApiResult<ForgetPasswordEmailResponseModel>> sendEmail(
    String email,
  ) async {
    try {
      ForgetPasswordEmailResponseModel response = await authApiClient.sendEmail(
        email,
      );
      return SuccessApiResult<ForgetPasswordEmailResponseModel>(data: response);
    } catch (e) {
      return ErrorApiResult<ForgetPasswordEmailResponseModel>(
        error: e as Exception,
      );
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseModel>> verifyResetCode(
    String resetCode,
  ) async {
    try {
      ForgetPasswordResponseModel response = await authApiClient
          .verifyResetCode(resetCode);
      return SuccessApiResult<ForgetPasswordResponseModel>(data: response);
    } catch (e) {
      return ErrorApiResult<ForgetPasswordResponseModel>(error: e as Exception);
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseModel>> changePassword(
    ChangePasswordRequestModel data,
  ) async {
    try {
      ForgetPasswordResponseModel response = await authApiClient.changePassword(
        data,
      );
      return SuccessApiResult<ForgetPasswordResponseModel>(data: response);
    } catch (e) {
      return ErrorApiResult<ForgetPasswordResponseModel>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<AuthLoginApiResponse>> login(
    AuthLoginRequestDto loginRequestModel,
  ) async {
    try {
      final response = await authApiClient.login(loginRequestModel);
      return BaseResponse.success(response);
    } catch (error) {
      return BaseResponse.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<BaseResponse<SignUpResponseModel>> signup(
    SignUpRequestDTO request,
  ) async {
    try {
      final response = await authApiClient.signup(request);

      return BaseResponse.success(response);
    } catch (e) {
      //final errorHandler = ErrorHandler.handle(e);
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  // @override
  // Future<BaseResponse<AuthLoginRequestDto>> login(
  //   AuthLoginRequestDto loginRequestModel,
  // ) async {
  //   try {
  //     final response = await authApiClient.login(loginRequestModel);
  //     return BaseResponse.success(response);
  //   } catch (error) {
  //     return BaseResponse.failure(ErrorHandler.handle(error));
  //   }

  // }
}
