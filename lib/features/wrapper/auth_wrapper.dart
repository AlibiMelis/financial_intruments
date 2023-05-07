import 'package:financial_instruments/features/login/login_page.dart';
import 'package:financial_instruments/features/wrapper/nav_wrapper.dart';
import 'package:financial_instruments/service/authentication/authentication.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, MainUser?>(
      builder: (context, mainUser) {
        if (mainUser == null) return const LoginPage();
        return const NavWrapper();
      },
    );
  }
}
