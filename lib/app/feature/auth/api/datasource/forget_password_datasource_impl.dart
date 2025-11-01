import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasources/forget_password_datasource_contract.dart';
import '../api_manger/auth_client.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract{
  ForgetPasswordDataSourceImpl(this.authApiClient);
  AuthApiClient authApiClient;
  @override
  Future<BaseResponse<ForgetPasswordEmailResponseModel>> sendEmail(String email) async {
    try {
      ForgetPasswordEmailResponseModel response = await authApiClient.sendEmail(email);
      return SuccessResponse<ForgetPasswordEmailResponseModel>(data:response);
    } catch (e) {
      return ErrorResponse<ForgetPasswordEmailResponseModel>(error: e as Exception);
      throw Exception(e);
    }
  }

}