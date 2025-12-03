import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';

class LoginState {
  final Resource<LoginEntity> loginStates;
  final bool rememberMe;

  LoginState({required this.loginStates, this.rememberMe = false});

  LoginState copyWith({Resource<LoginEntity>? loginStates, bool? rememberMe}) {
    return LoginState(
      loginStates: loginStates ?? this.loginStates,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
