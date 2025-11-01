import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:injectable/injectable.dart';

import '../repos/forget_password_repo_contract.dart';
@injectable
class SendForgetPasswordEmailUseCase{
  SendForgetPasswordEmailUseCase(this.repoContract);
  final ForgetPasswordRepoContract repoContract;
  Future<BaseResponse<ForgetPasswordEmailResponseModel>> call({required String email})=>repoContract.sendEmail(email);
}