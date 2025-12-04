import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/app/feature/auth/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';
import 'package:exam_app/app/feature/auth/domain/repos/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoLoginUsecase {
  final AuthRepoContract _repo;
  DoLoginUsecase(this._repo);

  Future<BaseResponse<LoginEntity>> dologinUseacase(
    AuthLoginRequestDto request,
  ) {
    return _repo.login(request);
  }
}
