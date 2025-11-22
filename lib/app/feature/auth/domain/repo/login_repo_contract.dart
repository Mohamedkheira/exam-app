import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/model/login_responce_model.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginResponceModel>> login(String email, String password);
}
