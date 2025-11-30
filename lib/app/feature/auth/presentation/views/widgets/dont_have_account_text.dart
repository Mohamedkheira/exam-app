import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/core/constants/widgets/app_text_button.dart';
import 'package:exam_app/app/core/constants/widgets/spacing.dart';
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.dontHaveAnAccount.tr(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        horizontalSpace(2),
        AppTextButton(
          text: LocaleKeys.signup.tr(),
          onPressed: () {},
          textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
