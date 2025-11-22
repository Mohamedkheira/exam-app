import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/api/api_clint/auth_client.dart';
import 'package:exam_app/app/feature/auth/data/data_source/remote/login_remote_datas_source_contract.dart';
import 'package:exam_app/app/feature/auth/data/model/login_responce_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDatasSourceContract)
class LoginRemoteDataSourceImp extends LoginRemoteDatasSourceContract {
  final HomeApiClint homeApiClint;

  LoginRemoteDataSourceImp({required this.homeApiClint});

  @override
  Future<BaseResponse<LoginResponceModel>> login(
    String email,
    String password,
  ) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
