import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/app/feature/auth/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/app/feature/auth/data/datasources/auth_datasource_contract.dart';
import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/reset_code_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/login_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/api_result.dart';
import '../../domain/repos/auth_repo_contract.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRepoImpl(this.authDataSourceContract);
  final AuthDataSourceContract authDataSourceContract;

  @override
  Future<ApiResult<ForgetPasswordEmailResponseModel>> sendEmail(
    String email,
  ) async {
    ApiResult<ForgetPasswordEmailResponseModel> response =
        await authDataSourceContract.sendEmail(email);
    switch (response) {
      case SuccessApiResult<ForgetPasswordEmailResponseModel>():
        return SuccessApiResult<ForgetPasswordEmailResponseModel>(
          data: response.data,
        );

      case ErrorApiResult<ForgetPasswordEmailResponseModel>():
        return ErrorApiResult<ForgetPasswordEmailResponseModel>(
          error: response.error,
        );
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseModel>> verifyResetCode(
    String resetCode,
  ) async {
    ApiResult<ForgetPasswordResponseModel> response =
        await authDataSourceContract.verifyResetCode(resetCode);
    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        return SuccessApiResult<ForgetPasswordResponseModel>(
          data: response.data,
        );
      case ErrorApiResult<ForgetPasswordResponseModel>():
        return ErrorApiResult<ForgetPasswordResponseModel>(
          error: response.error,
        );
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseModel>> changePassword(
    ChangePasswordRequestModel data,
  ) async {
    ApiResult<ForgetPasswordResponseModel> response =
        await authDataSourceContract.changePassword(data);
    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        return SuccessApiResult<ForgetPasswordResponseModel>(
          data: response.data,
        );
      case ErrorApiResult<ForgetPasswordResponseModel>():
        return ErrorApiResult<ForgetPasswordResponseModel>(
          error: response.error,
        );
    }
  }

  @override
  Future<BaseResponse<LoginEntity>> login(
    AuthLoginRequestDto loginRequestModel,
  ) async {
    final loginResponse = await authDataSourceContract.login(loginRequestModel);

    return loginResponse.map(
      success: (success) => BaseResponse.success(success.data.toEntity()),
      failure: (failure) => BaseResponse.failure(failure.errorhandeler),
    );
  }

  @override
  Future<BaseResponse<SignUpResponseModel>> signup(
    SignUpRequestDTO requestModel,
  ) async {
    final response = await authDataSourceContract.signup(requestModel);

    return response.map(
      success: (Success) => BaseResponse.success(Success.data),
      failure: (failure) => BaseResponse.failure(failure.errorhandeler),
    );
  }
}
