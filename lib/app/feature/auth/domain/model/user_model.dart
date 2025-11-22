import 'package:exam_app/app/feature/auth/data/model/user_responce_model.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? token;

  UserModel({this.uid, this.email, this.password, this.token, User? user});
}
