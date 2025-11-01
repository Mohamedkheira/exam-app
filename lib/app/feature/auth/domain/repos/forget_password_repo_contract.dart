import '../../data/models/forget_password_email_response_model.dart';

abstract class ForgetPasswordRepoContract{
  Future<ForgetPasswordEmailResponseModel> sendEmail(String email);


}