import '../../../../config/base_state/base_state.dart';

class VerifyOtpState{
  late Resource<void> verifyOtp;
  VerifyOtpState({required this.verifyOtp});

  VerifyOtpState.initial(){
    verifyOtp = Resource.initial();
  }
  VerifyOtpState copyWith({Resource<void>? verifyOtp}){
    return VerifyOtpState(verifyOtp: verifyOtp??this.verifyOtp);
  }
}