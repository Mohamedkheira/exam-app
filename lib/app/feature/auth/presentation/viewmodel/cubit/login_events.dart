sealed class LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;
  final bool rememberMe;

  Login({required this.email, required this.password, this.rememberMe = false});
}
