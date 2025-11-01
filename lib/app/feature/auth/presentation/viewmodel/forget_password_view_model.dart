import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../../domain/usecase/send_forget_password_email_usecase.dart';

class ForgetPasswordViewmodel {
  ForgetPasswordViewmodel(this.sendForgetPasswordEmailUseCase);
  final SendForgetPasswordEmailUseCase sendForgetPasswordEmailUseCase;
  void sendForgetPassword(String email) async {
    final response = await sendForgetPasswordEmailUseCase(email: email);
    print(response.toString());
  }
}
