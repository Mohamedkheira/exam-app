import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/config/di/di.dart';
import 'package:exam_app/app/core/constants/widgets/app_default_button.dart';
import 'package:exam_app/app/core/constants/widgets/app_text_button.dart';
import 'package:exam_app/app/core/constants/widgets/loading_indicator_widget.dart';
import 'package:exam_app/app/core/constants/widgets/spacing.dart';
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/resources/font_manager.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/core/utils/app_text_field.dart';
import 'package:exam_app/app/core/validators/app_validators.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_login/login_cubit.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_login/login_events.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_login/login_state.dart';
import 'package:exam_app/app/feature/auth/presentation/views/widgets/dont_have_account_text.dart';
import 'package:exam_app/app/feature/auth/presentation/views/widgets/remember_me_check_box.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginCubit _loginCubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          final loginState = state.loginStates;
          if (loginState.status == Status.loading) {
            showDialog(
              context: context,
              builder: (context) =>
                  Center(child: LoadingIndicator(size: 220.r)),
            );
          }
          if (loginState.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(loginState.error!)));
          }

          if (loginState.data != null) {
            Navigator.pop;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(LocaleKeys.loginSuccess)),
            );
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          final loginState = state.loginStates;

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: Text(
                LocaleKeys.login,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Form(
                key: cubit.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    AppTextField(
                      controller: cubit.emailController,
                      label: LocaleKeys.email,
                      hint: LocaleKeys.enterYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.validateEmail,
                    ),
                    verticalSpace(36),
                    AppTextField(
                      controller: cubit.passwordController,
                      label: LocaleKeys.password,
                      hint: LocaleKeys.enterYourPassword,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      validator: AppValidators.validatePassword,
                    ),
                    verticalSpace(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMeCheckBox(
                          label: LocaleKeys.rememberMe,
                          value: state.rememberMe,
                          onChanged: (value) {
                            cubit.toggleRememberMe(value ?? false);
                          },
                        ),
                        AppTextButton(
                          text: LocaleKeys.forgetPassword,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.forgetPassword);
                          },
                          textColor: AppColors.blackColor,
                          underline: true,
                        ),
                      ],
                    ),
                    verticalSpace(48),
                    AppDefaultButton(
                      text: LocaleKeys.login,
                      isLoading: loginState.status == Status.loading,
                      onPressed: () {
                        if (!cubit.formkey.currentState!.validate()) {
                          cubit.onEvent(
                            Login(
                              email: cubit.emailController.text.trim(),
                              password: cubit.passwordController.text.trim(),
                              rememberMe: state.rememberMe,
                            ),
                          );
                          return;
                        }
                      },
                    ),
                    verticalSpace(16),
                    DontHaveAccountText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


/*

*/