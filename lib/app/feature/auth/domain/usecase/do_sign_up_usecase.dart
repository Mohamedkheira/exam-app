import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/repos/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoSignUpUsecase {
  final AuthRepoContract repoSignUpContract;

  DoSignUpUsecase(this.repoSignUpContract);

  Future<BaseResponse<SignUpResponseModel>> doSignUp(
    SignUpRequestDTO request,
  ) async {
    return await repoSignUpContract.signup(request);
  }
}
