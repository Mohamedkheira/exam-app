import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/config/di/di.dart';
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/resources/font_manager.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/core/utils/app_text_field.dart';
import 'package:exam_app/app/core/validators/app_validators.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_sign_up/sign_up_cubit.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_sign_up/sign_up_event.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_sign_up/sign_up_state.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  SignUpCubit signUpCubit = getIt<SignUpCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpCubit,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          final signUpState = state.signUpBaseState;

          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          if (signUpState.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 12.w),
                    Text(LocaleKeys.loading.tr()),
                  ],
                ),
                duration: Duration(days: 1),
              ),
            );
          } else if (signUpState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(signUpState.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          } else if (signUpState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(LocaleKeys.loginSuccess.tr()),
                backgroundColor: Colors.green,
              ),
            );
          }
        },

        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackColor,
                ),
                onPressed: () {},
              ),
              title: Text(LocaleKeys.register.tr()),
            ),

            body: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    spacing: 16.h,
                    children: [
                      AppTextField(
                        controller: cubit.usernameController,
                        hint: LocaleKeys.enterUserName.tr(),
                        label: LocaleKeys.userName.tr(),
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.validateUserName,
                      ),
                      Row(
                        spacing: 17.w,
                        children: [
                          Expanded(
                            child: AppTextField(
                              controller: cubit.firstnameController,
                              hint: LocaleKeys.enterFirstName.tr(),
                              label: LocaleKeys.firstName.tr(),
                              textInputAction: TextInputAction.next,
                              validator: AppValidators.validateFirstName,
                            ),
                          ),
                          Expanded(
                            child: AppTextField(
                              controller: cubit.lastnameController,
                              hint: LocaleKeys.enterLastName.tr(),
                              label: LocaleKeys.lastName.tr(),
                              textInputAction: TextInputAction.next,
                              validator: AppValidators.validateLastName,
                            ),
                          ),
                        ],
                      ),

                      AppTextField(
                        controller: cubit.emailController,
                        hint: LocaleKeys.enterEmail.tr(),
                        label: LocaleKeys.email.tr(),
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.validateEmail,
                      ),
                      Row(
                        spacing: 17.w,
                        children: [
                          Expanded(
                            child: AppTextField(
                              controller: cubit.passwordController,
                              hint: LocaleKeys.enterPassword.tr(),
                              label: LocaleKeys.password.tr(),
                              isPassword: true,
                              textInputAction: TextInputAction.go,
                              validator: AppValidators.validatePassword,
                            ),
                          ),
                          Expanded(
                            child: AppTextField(
                              controller: cubit.confirmPasswordController,
                              hint: LocaleKeys.enterPasswordConfirm.tr(),
                              label: LocaleKeys.passwordConfirmation.tr(),
                              isPassword: true,
                              textInputAction: TextInputAction.go,
                              validator: (value) =>
                                  AppValidators.validateConfirmPassword(
                                    value,
                                    cubit.passwordController.text,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      AppTextField(
                        controller: cubit.phoneController,
                        hint: LocaleKeys.phoneNumber.tr(),
                        label: LocaleKeys.enterPhoneNumber.tr(),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.go,
                        validator: AppValidators.validateNumberPhone,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            activeColor: AppColors.blackColor,
                            onChanged: (value) {
                              cubit.toggleRememberMe(value ?? false);
                            },
                          ),
                          InkWell(
                            onTap: () {
                              cubit.toggleRememberMe(!state.rememberMe);
                            },
                            child: Text(
                              LocaleKeys.rememberMe.tr(),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!cubit.formKey.currentState!.validate()) {
                              cubit.onEvent(
                                SubmitSignUpEvent(
                                  username: cubit.usernameController.text
                                      .trim(),
                                  firstname: cubit.firstnameController.text
                                      .trim(),
                                  lastname: cubit.lastnameController.text
                                      .trim(),
                                  email: cubit.emailController.text.trim(),
                                  password: cubit.passwordController.text
                                      .trim(),
                                  passwordConfirmation: cubit
                                      .confirmPasswordController
                                      .text
                                      .trim(),
                                  phone: cubit.phoneController.text.trim(),
                                ),
                              );
                              return;
                            }
                          },
                          style: ElevatedButton.styleFrom(),
                          child: Text(
                            LocaleKeys.signup.tr(),
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
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontFamily: FontsFamily.inter,
                                  color: AppColors.blackColor,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              LocaleKeys.login.tr(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
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
            ),
          );
        },
      ),
    );
  }
}
