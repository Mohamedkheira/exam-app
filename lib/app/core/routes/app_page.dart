import 'package:exam_app/app/core/routes/app_route.dart';
import 'package:exam_app/app/feature/auth/presentation/views/screens/login_screen.dart';
import 'package:exam_app/app/feature/home/presentation/views/screens/home_screen.dart';
import 'package:exam_app/app/feature/auth/presentation/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../feature/auth/presentation/views/screens/change_password_screen.dart';
import '../../feature/auth/presentation/views/screens/forget_password_screen.dart';
import '../../feature/auth/presentation/views/screens/otp_screen_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreenScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: Center(child: Text('No Route Found')),
      ),
    );
  }
}
