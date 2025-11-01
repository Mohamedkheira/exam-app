import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/core/routes/app_page.dart';
import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/config/di/di.dart';

void main() async {
  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: const MyApp(),
  ));
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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
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
