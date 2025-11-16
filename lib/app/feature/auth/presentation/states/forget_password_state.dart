import 'package:exam_app/app/config/base_state/base_state.dart';

class ForgetPasswordState {
  late Resource<void> forgetPassword;

  ForgetPasswordState({ required this.forgetPassword});

  ForgetPasswordState.initial(){
    forgetPassword = Resource.initial();
  }


  ForgetPasswordState copyWith({Resource<void>? forgetPassword}) {
    return ForgetPasswordState(
        forgetPassword: forgetPassword ?? this.forgetPassword
    );
  }
}