import 'package:financial_instruments/global/keys.dart';
import 'package:financial_instruments/service/navigation/router_global.dart';

import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Keys.globalNavigationKey,
      initialRoute: 'login',
      onGenerateRoute: RouterGlobal.generateRoute,
    );
  }
}
