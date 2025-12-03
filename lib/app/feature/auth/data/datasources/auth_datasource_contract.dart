import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/app/feature/auth/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';

import '../../../../config/base_response/api_result.dart';
import '../models/reset_code_response_model.dart';

abstract class AuthDataSourceContract {
  Future<ApiResult<ForgetPasswordEmailResponseModel>> sendEmail(String email);
  Future<ApiResult<ForgetPasswordResponseModel>> verifyResetCode(
    String resetCode,
  );
  Future<ApiResult<ForgetPasswordResponseModel>> changePassword(
    ChangePasswordRequestModel data,
  );
  Future<BaseResponse<AuthLoginApiResponse>> login(
    AuthLoginRequestDto loginRequestModel,
  );
  Future<BaseResponse<SignUpResponseModel>> signup(SignUpRequestDTO request);
}
