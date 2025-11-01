import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../../../../config/base_response/base_response.dart';

abstract class ForgetPasswordDataSourceContract{
  Future<BaseResponse<ForgetPasswordEmailResponseModel>> sendEmail(String email);
}