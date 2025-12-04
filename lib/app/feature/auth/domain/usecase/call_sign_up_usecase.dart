import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/models/request/sign_up_request_model.dart';
import 'package:exam_app/app/feature/auth/data/models/response/sign_up_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/repos/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class CallSignUpUseCase {
  final AuthRepoContract _repoSignUpContract;

  CallSignUpUseCase(this._repoSignUpContract);

  Future<BaseResponse<SignUpResponseModel>> call(
    SignUpRequestDTO request,
  ) async {
    return await _repoSignUpContract.signup(request);
  }
}
