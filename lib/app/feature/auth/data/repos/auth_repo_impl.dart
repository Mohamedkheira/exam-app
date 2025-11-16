import 'package:exam_app/app/feature/auth/data/datasources/auth_datasource_contract.dart';
import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/reset_code_response_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/api_result.dart';
import '../../domain/repos/auth_repo_contract.dart';

@Injectable(as:AuthRepoContract)
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
    ApiResult<ForgetPasswordResponseModel> response = await authDataSourceContract
        .verifyResetCode(resetCode);
    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        return SuccessApiResult<ForgetPasswordResponseModel>(data: response.data);
      case ErrorApiResult<ForgetPasswordResponseModel>():
        return ErrorApiResult<ForgetPasswordResponseModel>(error: response.error);
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseModel>> changePassword(ChangePasswordRequestModel data) async{
    ApiResult<ForgetPasswordResponseModel> response = await authDataSourceContract
        .changePassword(data);
    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        return SuccessApiResult<ForgetPasswordResponseModel>(data: response.data);
      case ErrorApiResult<ForgetPasswordResponseModel>():
        return ErrorApiResult<ForgetPasswordResponseModel>(error: response.error);
    }
  }
}
