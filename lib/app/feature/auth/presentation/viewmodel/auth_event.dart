import '../../data/models/change_password_request_model.dart';

abstract class AuthEvent {}

class ChangePassword extends AuthEvent {
  final ChangePasswordRequestModel data;
  ChangePassword(this.data);
}

class VerifyOtp extends AuthEvent {
final String resetCode;
VerifyOtp(this.resetCode);
}

class SendForgetPasswordEmail extends AuthEvent {
  final String email;
  SendForgetPasswordEmail(this.email);
}
