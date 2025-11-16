import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/config/di/di.dart';
import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:exam_app/app/feature/auth/presentation/states/verify_otp_state.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/otp_viewmodel.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../../../core/routes/app_route.dart';
import '../../viewmodel/auth_event.dart';
class OtpScreenScreen extends StatefulWidget {
  const OtpScreenScreen({super.key});

  @override
  State<OtpScreenScreen> createState() => _OtpScreenScreenState();
}

class _OtpScreenScreenState extends State<OtpScreenScreen> {
  bool hasError = false;
  final OtpViewmodel vm=getIt<OtpViewmodel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpViewmodel, VerifyOtpState>(
      bloc:vm,
      listener:(context,state){
      if (state.verifyOtp.status == Status.success) {
        Navigator.pushNamed(context, Routes.changePassword);

      }
      else if(state.verifyOtp.status == Status.error){
        _showMessage("something went wrong");
      }
    },
      builder:(context,state)=>Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),

              Text(
                LocaleKeys.emailVerification.tr(),
                style: context.textTheme.headlineSmall,
              ),
              Text(
                LocaleKeys.enterOtp.tr(),
                style: context.textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              if (state.verifyOtp.status == Status.loading)
                CircularProgressIndicator(),

              otpTab(state),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.receiveCodeQuestion.tr(),
                    style: context.textTheme.labelSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      // resend logic
                    },
                    child: Text(
                      LocaleKeys.resend.tr(),
                      style: context.textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
      ,
    );
  }

  Widget otpTab(VerifyOtpState state) {
    final hasError = state.verifyOtp.status == Status.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: OtpTextField(
            numberOfFields: 4,
            showFieldAsBox: true,
            fieldWidth: 70,
            borderRadius: BorderRadius.circular(14),
            filled: true,
            fillColor: const Color(0xFFEFF4FF),
            borderColor: hasError ? Colors.red : Colors.transparent,
            focusedBorderColor: Colors.blue,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            onSubmit: (code) {

              vm.doIntent(
                VerifyOtp(code), // your MVI event
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        if (hasError)
          const Text(
            "Invalid code.",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
