import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/config/base_state/login_base_state.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/usecase/do_sign_up_usecase.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_sign_up/sign_up_event.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final DoSignUpUsecase _doSignUpUsecase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpCubit(this._doSignUpUsecase)
    : super(
        SignUpState(
          signUpBaseState: BaseState<SignUpResponseModel>(isLoading: false),
        ),
      );

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  void onEvent(SignUpEvent event) {
    if (event is SubmitSignUpEvent) {
      _handleSignUp(event);
    }
  }

  void doIntent(SignUpEvent event) async {
    switch (event) {
      case SubmitSignUpEvent():
        await _handleSignUp(event);
        break;
    }
  }

  Future<void> _handleSignUp(SubmitSignUpEvent event) async {
    emit(
      state.copyWith(
        signUpBaseState: BaseState<SignUpResponseModel>(isLoading: true),
      ),
    );

    final request = SignUpRequestDTO(
      username: event.username,
      firstName: event.firstname,
      lastName: event.lastname,
      email: event.email,
      phone: event.phone,
      password: event.password,
      rePassword: event.passwordConfirmation,
    );

    final response = await _doSignUpUsecase.doSignUp(request);

    response.when(
      success: (data) => emit(
        state.copyWith(
          signUpBaseState: BaseState<SignUpResponseModel>(
            isLoading: false,
            data: data,
          ),
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          signUpBaseState: BaseState<SignUpResponseModel>(
            isLoading: false,
            errorMessage: error.apiErrorModel.message,
          ),
        ),
      ),
    );
  }
}
