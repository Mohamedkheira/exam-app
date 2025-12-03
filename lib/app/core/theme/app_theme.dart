import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),

    // appBarTheme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.blackColor),
       leadingWidth: 20.w,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontFamily: FontsFamily.inter,
        fontSize: 20,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r)
            ),
            ),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.h)
            ),
            
      )
    ),


    // textStyle
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontFamily: FontsFamily.inter,
        fontSize: FontSize.s13,
        fontWeight: FontWeights.regular,
        color: AppColors.textColor
      ),
      titleMedium: TextStyle(
        fontFamily: FontsFamily.roboto,
        fontSize: FontSize.s16,
        fontWeight: FontWeights.medium,
        color: AppColors.whiteColor
      ),
    )
  );
}
