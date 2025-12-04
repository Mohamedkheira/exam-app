import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/feature/auth/domain/usecase/verify_reset_code_usecase.dart';
import 'package:exam_app/app/feature/auth/presentation/states/verify_otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/api_result.dart';
import '../../data/models/reset_code_response_model.dart';
import 'auth_event.dart';
@injectable
class OtpViewmodel extends Cubit<VerifyOtpState>{
  VerifyResetCodeUsecase verifyResetCodeUsecase;
  OtpViewmodel(this.verifyResetCodeUsecase):super(VerifyOtpState.initial());
  void doIntent(AuthEvent event) {
    switch (event) {
      case VerifyOtp():_verifyOtp(event.resetCode);
    }
  }
  void _verifyOtp(String resetCode) async {
    emit(state.copyWith(verifyOtp: Resource.loading()));

    final response = await verifyResetCodeUsecase(resetCode:resetCode );

    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        emit(state.copyWith(verifyOtp: Resource.success(response.data)));
      case ErrorApiResult<ForgetPasswordResponseModel>():
        emit(
          state.copyWith(
            verifyOtp: Resource.error(response.error.toString()),
          ),
        );
    }
  }

}