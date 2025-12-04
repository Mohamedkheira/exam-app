import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/change_password_viewmodel.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../../../../config/di/di.dart';
import '../../../../../core/utils/app_primary_button.dart';
import '../../../../../core/utils/app_text_field.dart';
import '../../../data/models/change_password_request_model.dart';
import '../../states/change_password_state.dart';
import '../../viewmodel/auth_event.dart';



class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();

}
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  final ChangePasswordViewmodel viewModel = getIt();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordViewmodel, ChangePasswordState>(
      bloc: viewModel,
      listener:(context,state){
        if (state.changePassword.status == Status.success) {
          Navigator.pushNamed(context, Routes.login);

        }else if(state.changePassword.status == Status.error){
          _showMessage("something went wrong");

        }
      },
      builder:(context,state) => Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40 ,horizontal: 15),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            SizedBox(height: 60,),
            forgetPasswordHeader(),
            SizedBox(height: 40,),
            AppTextField(controller: passwordController,
                label: LocaleKeys.newPassword.tr(),
                hint: LocaleKeys.enterYourPassword.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            AppTextField(controller: newPasswordController,
                label: LocaleKeys.confirmPassword.tr(),
                hint: LocaleKeys.confirmPassword.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                }
                return null;
              },
            ),
            SizedBox(height: 60,),
            if (state.changePassword.status == Status.loading)
              CircularProgressIndicator(),
            AppPrimaryButton(
              text: LocaleKeys.continueTxt.tr(),
              onPressed: () {
                final data = ChangePasswordRequestModel(
                  oldPassword: passwordController.text,
                  password: newPasswordController.text,
                  rePassword: newPasswordController.text,
                );

                viewModel.doIntent(
                  ChangePassword(data),
                );
              },
            )


          ],
        ),
      ),
    )
    ,
    );

  }
  Widget forgetPasswordHeader(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(

        children: [
          Text(LocaleKeys.resetPassword.tr(),style:context.textTheme.headlineMedium),
          SizedBox(height: 15,),

          Text(LocaleKeys.resetPasswordQuote.tr(),style: context.textTheme.headlineSmall,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

}
