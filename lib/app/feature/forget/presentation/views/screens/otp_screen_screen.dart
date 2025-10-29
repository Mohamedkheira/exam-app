import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/theme/app_theme.dart';
import 'package:exam_app/app/core/utils/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreenScreen extends StatefulWidget {
  const OtpScreenScreen({super.key});

  @override
  State<OtpScreenScreen> createState() => _OtpScreenScreenState();
}

class _OtpScreenScreenState extends State<OtpScreenScreen> {
  bool hasError=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Password"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            SizedBox(height: 60,),

            Text("Email verification",style: TextStyle(fontSize:18,color: AppColors.blackColor,fontWeight: FontWeight.bold )
              ,),
            Text("Please enter your code that send to your email address ",style: TextStyle(fontSize:14,color: AppColors.blackColor),),
            SizedBox(height: 20,),
            otpTab(true),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive code? ",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {
                    // resend logic
                  },
                  child: Text(
                    "Resend",
                    style: context.textTheme.displayMedium,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
     );

  }

  Widget otpTab(bool hasError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: OtpTextField(
            numberOfFields: 4,
            showFieldAsBox: true,
            fieldWidth: (1.sw - 80.w) / 4,
            borderRadius: BorderRadius.circular(14),
            filled: true,
            fillColor: const Color(0xFFEFF4FF),
            borderColor: hasError? Colors.red:Colors.transparent,
            focusedBorderColor:Colors.blue,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        const SizedBox(height: 5),
        if (hasError)
          const Text(
            "Invalid code.",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.red,fontSize: 13, fontWeight: FontWeight.w500),
          ),
      ],
    );
  }

}
