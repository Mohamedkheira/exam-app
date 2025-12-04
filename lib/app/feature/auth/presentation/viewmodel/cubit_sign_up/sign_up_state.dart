import 'package:exam_app/app/config/base_state/login_base_state.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';

class SignUpState {
  BaseState<SignUpResponseModel> signUpBaseState;
  final bool rememberMe;

  SignUpState({required this.signUpBaseState, this.rememberMe = false});

  SignUpState copyWith({
    BaseState<SignUpResponseModel>? signUpBaseState,
    bool? rememberMe,
  }) {
    return SignUpState(
      signUpBaseState: signUpBaseState ?? this.signUpBaseState,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

// part of 'sign_up_cubit.dart';

// abstract class SignUpState {}

// class SignUpInitial extends SignUpState {}

// class SignUpLoading extends SignUpState {}

// class SignUpSuccess extends SignUpState {
//   final SignUpResponseModel response;
//   SignUpSuccess(this.response);
// }

// class SignUpError extends SignUpState {
//   final String message;
//   SignUpError(this.message);
// }
