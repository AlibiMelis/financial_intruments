import 'package:financial_instruments/core/utils/widgets/not_found_page.dart';
import 'package:financial_instruments/features/login/views/login_page.dart';
import 'package:financial_instruments/features/login/views/otp_verification_page.dart';
import 'package:financial_instruments/features/wrapper/nav_wrapper.dart';
import 'package:flutter/material.dart';

class RouterGlobal {
  RouterGlobal._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'otp_verification':
        return MaterialPageRoute(builder: (_) => const OTPVerificationPage());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const NavWrapper());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
