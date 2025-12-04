import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/usecase/change_password_usecase.dart';
import 'package:exam_app/app/feature/auth/presentation/states/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/send_forget_password_email_usecase.dart';
import 'auth_event.dart';
@injectable
class ForgetPasswordViewmodel extends Cubit<ForgetPasswordState> {
  final SendForgetPasswordEmailUseCase _sendForgetPasswordEmailUseCase;

  ForgetPasswordViewmodel(this._sendForgetPasswordEmailUseCase)
    : super(ForgetPasswordState.initial());
  void doIntent(AuthEvent event) {
    switch (event) {
      case SendForgetPasswordEmail():_sendForgetPasswordEmail(event.email);
    }
  }
  void _sendForgetPasswordEmail(String email) async {
    emit(state.copyWith(forgetPassword: Resource.loading()));

    final response = await _sendForgetPasswordEmailUseCase(email: email);

    switch (response) {
      case SuccessApiResult<ForgetPasswordEmailResponseModel>():
        emit(state.copyWith(forgetPassword: Resource.success(response.data)));
      case ErrorApiResult<ForgetPasswordEmailResponseModel>():
        emit(
          state.copyWith(
            forgetPassword: Resource.error(response.error.toString()),
          ),
        );
    }
  }
}
