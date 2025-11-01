import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../repos/forget_password_repo_contract.dart';

class SendForgetPasswordEmailUseCase{
  SendForgetPasswordEmailUseCase(this.repoContract);
  final ForgetPasswordRepoContract repoContract;
  Future<ForgetPasswordEmailResponseModel> call({required String email})=>repoContract.sendEmail(email);
}