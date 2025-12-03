import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontsFamily {
  static const String roboto = 'Roboto';
  static const String inter = 'Inter';
}

abstract class FontWeights {
  static const black = FontWeight.w900;
  static const extraBold = FontWeight.w800;
  static const bold = FontWeight.w700;
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
  static const extraLight = FontWeight.w200;
  static const thin = FontWeight.w100;
}

abstract class FontSize {
  static double s12 = 12.0.sp;
  static double s13 = 13.0.sp;
  static double s14 = 14.0.sp;
  static double s16 = 16.0.sp;
  static double s17 = 17.0.sp;
  static double s18 = 18.0.sp;
  static double s20 = 20.0.sp;
  static double s22 = 22.0.sp;
  static double s24 = 24.0.sp;
  static double s28 = 28.0.sp;
  static double s40 = 40.0.sp;
}
