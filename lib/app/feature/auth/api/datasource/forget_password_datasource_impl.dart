import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../../data/datasources/forget_password_datasource_contract.dart';
import '../api_manger/auth_client.dart';

class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract{
  ForgetPasswordDataSourceImpl(this.authApiClient);
  AuthApiClient authApiClient;
  @override
  Future<ForgetPasswordEmailResponseModel> sendEmail(String email) async {
    try {
      ForgetPasswordEmailResponseModel response = await authApiClient.sendEmail(email);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}