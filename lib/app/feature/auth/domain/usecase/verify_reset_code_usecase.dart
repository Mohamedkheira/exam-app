import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:exam_app/app/feature/auth/data/models/reset_code_response_model.dart';
import 'package:injectable/injectable.dart';

import '../repos/auth_repo_contract.dart';
@injectable
class VerifyResetCodeUsecase{
  VerifyResetCodeUsecase(this.repoContract);
  final AuthRepoContract repoContract;
  Future<ApiResult<ForgetPasswordResponseModel>> call({required String resetCode})=>repoContract.verifyResetCode(resetCode);
}