import 'package:flutter/material.dart';
import 'package:pikbil_app/views/home/homepage.dart';
import 'package:pikbil_app/views/landingpage/landingpage.dart';
import 'package:pikbil_app/views/login/create_password.dart';
import 'package:pikbil_app/views/login/forgot_password.dart';
import 'package:pikbil_app/views/login/login.dart';
import 'package:pikbil_app/views/register/email_otp.dart';
import 'package:pikbil_app/views/register/register.dart';

class RoutingPage {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPageRoute(LandingPage());
      case '/login':
        return _buildPageRoute(const LoginPage());
      case '/home':
        return _buildPageRoute(const HomePage());
      case '/verifemail':
        return _buildPageRoute(const EmailVerifPage());
      case '/register':
        return _buildPageRoute(const RegisterPage());
      case '/forgotpassword':
        return _buildPageRoute(const ForgotPasswordPage());
      case '/createpassword':
        return _buildPageRoute(const CreatePasswordPage());
      default:
        return _buildPageRoute(const HomePage());
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
            parent: animation, curve: Curves.fastLinearToSlowEaseIn);
        return Align(
          alignment: Alignment.topRight,
          child: ScaleTransition(scale: animation, child: page),
        );
      },
      transitionDuration: const Duration(milliseconds: 700),
    );
  }
}
