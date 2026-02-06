import 'package:exam_app/app/config/base_state/base_state.dart';

class ChangePasswordState {
  late Resource<void> changePassword;

  ChangePasswordState({ required this.changePassword});

  ChangePasswordState.initial(){
    changePassword = Resource.initial();
  }


  ChangePasswordState copyWith({Resource<void>? changePassword}) {
    return ChangePasswordState(
        changePassword: changePassword ?? this.changePassword
    );
  }
}