import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

abstract class ForgetPasswordDataSourceContract{
  Future<ForgetPasswordEmailResponseModel> sendEmail(String email);
}