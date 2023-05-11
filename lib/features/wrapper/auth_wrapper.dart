import 'package:financial_instruments/core/global/keys.dart';
import 'package:financial_instruments/core/service/authentication/cubit/authentication_cubit.dart';
import 'package:financial_instruments/core/service/navigation/router_global.dart';
import 'package:financial_instruments/core/utils/extensions.dart';

import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    context.bloc<BaseAuthentication>().stream.listen((mainUser) {
      if (mainUser == null) {
        Keys.globalNavigationKey.currentState?.pushNamedAndRemoveUntil('login', (route) => false);
      } else {
        Keys.globalNavigationKey.currentState?.pushNamedAndRemoveUntil('dashboard', (route) => false);
      }
    });
    context.bloc<BaseAuthentication>().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Keys.globalNavigationKey,
      initialRoute: 'login',
      onGenerateRoute: RouterGlobal.generateRoute,
    );
  }
}
