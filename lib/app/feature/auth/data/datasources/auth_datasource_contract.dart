import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../../../../config/base_response/api_result.dart';
import '../models/reset_code_response_model.dart';

abstract class AuthDataSourceContract{
  Future<ApiResult<ForgetPasswordEmailResponseModel>> sendEmail(String email);
  Future<ApiResult<ForgetPasswordResponseModel>> verifyResetCode(String resetCode);
  Future<ApiResult<ForgetPasswordResponseModel>> changePassword(ChangePasswordRequestModel data);


}