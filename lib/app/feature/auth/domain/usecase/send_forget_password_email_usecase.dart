import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:injectable/injectable.dart';

import '../repos/auth_repo_contract.dart';

@injectable
class SendForgetPasswordEmailUseCase {
  SendForgetPasswordEmailUseCase(this.repoContract);

  final AuthRepoContract repoContract;

  Future<ApiResult<ForgetPasswordEmailResponseModel>> call({
    required String email,
  }) => repoContract.sendEmail(email);
}
