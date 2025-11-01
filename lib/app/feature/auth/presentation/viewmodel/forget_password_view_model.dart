import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/presentation/states/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/send_forget_password_email_usecase.dart';

class ForgetPasswordViewmodel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewmodel(this.sendForgetPasswordEmailUseCase):super(ForgetPasswordState());
  final SendForgetPasswordEmailUseCase sendForgetPasswordEmailUseCase;
  void sendForgetPassword(String email) async {
    final response = await sendForgetPasswordEmailUseCase(email: email);

    print(response.toString());
  }
}
