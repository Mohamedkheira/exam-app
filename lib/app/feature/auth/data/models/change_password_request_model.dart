class ChangePasswordRequestModel{
  final String oldPassword;
  final String password;
  final String rePassword;



  ChangePasswordRequestModel({
    required this.oldPassword,
    required this.password,
    required this.rePassword

  });
}