import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/feature/auth/data/models/change_password_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/reset_code_response_model.dart';
import '../repos/auth_repo_contract.dart';
@injectable
class ChangePasswordUsecase{
  ChangePasswordUsecase(this.repoContract);
  final AuthRepoContract repoContract;
  Future<ApiResult<ForgetPasswordResponseModel>> call(
      {required ChangePasswordRequestModel data})=>repoContract.changePassword(data);
}