import 'package:exam_app/app/feature/auth/data/datasources/forget_password_datasource_contract.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';

import '../../domain/repos/forget_password_repo_contract.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract{
  ForgetPasswordRepoImpl(this.forgetPasswordDataSourceContract);
  final ForgetPasswordDataSourceContract forgetPasswordDataSourceContract;


  @override
  Future<ForgetPasswordEmailResponseModel> sendEmail(String email) async {
    ForgetPasswordEmailResponseModel response =await forgetPasswordDataSourceContract.sendEmail(email);
    return response;
  }

}