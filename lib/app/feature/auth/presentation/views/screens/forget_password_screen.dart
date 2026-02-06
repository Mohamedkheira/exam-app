import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:exam_app/app/core/utils/app_primary_button.dart';
import 'package:exam_app/app/core/utils/app_text_field.dart';
import 'package:exam_app/app/feature/auth/presentation/states/forget_password_state.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/forget_password_view_model.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/routes/app_route.dart';
import '../../viewmodel/auth_event.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final ForgetPasswordViewmodel viewModel = getIt();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewmodel, ForgetPasswordState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state.forgetPassword.status == Status.success) {
          Navigator.pushNamed(context, Routes.otpScreen);

        }
        else if(state.forgetPassword.status==Status.error){
          _showMessage("something went wrong");
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                forgetPasswordHeader(),
                SizedBox(height: 40),
                AppTextField(
                  controller: emailController,
                  label: LocaleKeys.email.tr(),
                  hint: LocaleKeys.enterYourEmail.tr(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return LocaleKeys.enterYourEmail.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                if (state.forgetPassword.status == Status.loading)
                  CircularProgressIndicator(),
                AppPrimaryButton(
                  text: LocaleKeys.continueTxt.tr(),
                  onPressed: () {
                    viewModel.doIntent(SendForgetPasswordEmail(emailController.text));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  Widget forgetPasswordHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          Text(
            LocaleKeys.forgetPassword.tr(),
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(height: 10),

          Text(
            LocaleKeys.forgetPasswordQuote.tr(),
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
