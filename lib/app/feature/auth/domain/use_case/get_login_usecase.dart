import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/model/login_responce_model.dart';
import 'package:exam_app/app/feature/auth/domain/repo/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepoContract homeRepo;

  LoginUsecase({required this.homeRepo});

  Future<BaseResponse<LoginResponceModel>> call(
    String email,
    String password,
  ) => homeRepo.login(email, password);
}
