import 'package:exam_app/app/core/routes/app_page.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData(),
          onGenerateRoute: RouteGenerator.getRoutes,
          initialRoute: Routes.otp,
        );
      },
    );
  }
}
