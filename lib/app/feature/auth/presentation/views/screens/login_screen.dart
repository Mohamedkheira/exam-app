import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/resources/font_manager.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/core/utiles/app_text_field.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(LocaleKeys.login.tr()),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16.h,
            children: [
              AppTextField(
                controller: emailController,
                hint: LocaleKeys.enterEmail.tr(),
                label: LocaleKeys.email.tr(),
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: passwordController,
                hint: LocaleKeys.enterPassword.tr(),
                label: LocaleKeys.password.tr(),
                isPassword: true,
                textInputAction: TextInputAction.go,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: AppColors.blackColor,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val ?? false;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Text(
                      LocaleKeys.rememberMe.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),

                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.forgetPassword.tr(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(),
                  child: Text(
                    LocaleKeys.login.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    LocaleKeys.dontHaveAnAccount.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFamily: FontsFamily.inter,
                      color: AppColors.blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: Text(
                      LocaleKeys.signup.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        fontFamily: FontsFamily.inter,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
