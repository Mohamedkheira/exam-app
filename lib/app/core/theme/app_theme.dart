import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:exam_app/app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      tertiary: AppColors.blueColor,
    ),

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.blackColor),
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontFamily: FontsFamily.inter,
        fontSize: 20,
      ),
    ),

    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: FontSize.s14,
        color: AppColors.greyColor,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(fontSize: 16, color: Colors.black54),
    ),
  );
}
