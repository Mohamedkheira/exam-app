import 'package:exam_app/app/config/base_response/base_response.dart';

import '../../data/models/forget_password_email_response_model.dart';

abstract class ForgetPasswordRepoContract{
  Future<BaseResponse<ForgetPasswordEmailResponseModel>> sendEmail(String email);

}