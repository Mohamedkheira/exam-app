import 'package:exam_app/app/feature/auth/data/datasources/forget_password_datasource_contract.dart';
import 'package:exam_app/app/feature/auth/data/models/forget_password_email_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../domain/repos/forget_password_repo_contract.dart';
@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract{
  ForgetPasswordRepoImpl(this.forgetPasswordDataSourceContract);
  final ForgetPasswordDataSourceContract forgetPasswordDataSourceContract;


  @override
  Future<BaseResponse<ForgetPasswordEmailResponseModel>> sendEmail(String email) async {

      BaseResponse<ForgetPasswordEmailResponseModel> response =await forgetPasswordDataSourceContract.sendEmail(email);
      switch(response){
        case SuccessResponse<ForgetPasswordEmailResponseModel>():

          return SuccessResponse<ForgetPasswordEmailResponseModel>(data: response.data);

        case ErrorResponse<ForgetPasswordEmailResponseModel>():
          return ErrorResponse<ForgetPasswordEmailResponseModel>(error: response.error);

      }



  }

}