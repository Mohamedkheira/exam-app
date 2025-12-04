import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SubmitSignUpEvent extends SignUpEvent {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final bool rememberMe;

  const SubmitSignUpEvent({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    this.rememberMe = false,
  });

  @override
  List<Object?> get props => [
    username,
    firstname,
    lastname,
    email,
    phone,
    password,
    passwordConfirmation,
    rememberMe,
  ];
}
