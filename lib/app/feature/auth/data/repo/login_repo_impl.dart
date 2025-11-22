import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/data_source/remote/login_remote_datas_source_contract.dart';
import 'package:exam_app/app/feature/auth/data/model/login_responce_model.dart';
import 'package:exam_app/app/feature/auth/domain/repo/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl extends LoginRepoContract {
  @override
  Future<BaseResponse<LoginResponceModel>> login(
    String email,
    String password,
  ) {
    // TODO: implement login
    throw UnimplementedError();
  }
  // @override
  // Future<BaseResponse<LoginResponceModel>> login(
  //   String email,
  //   String password,
  // ) {
  //   // try {
  //   //   BaseResponse<LoginResponceModel> response =
  //   //       await loginRemoteDatasSourceContract.login(data);
  //   //   switch (response) {
  //   //     case SuccessResponse<LoginResponceModel>():
  //   //       return SuccessResponse<LoginResponceModel>(data:);

  //   //     case ErrorResponse():
  //   //       // TODO: Handle this case.
  //   //       throw UnimplementedError();
  //   //   }
  //   // } catch (e) {
  //   //   throw Exception(e);
  //   // }

  //   throw ArgumentError();
  // }
}
