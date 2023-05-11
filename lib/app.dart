import 'package:financial_instruments/core/service/authentication/cubit/authentication_cubit.dart';
import 'package:financial_instruments/core/service/authentication/injection/repo_di.dart';
import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/core/utils/hive_adapters.dart';
import 'package:financial_instruments/features/wrapper/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    registerAdapters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSans'),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BaseAuthentication>(create: (context) => AuthenticationCubit(repository: AuthenticationRepositoryInject.authenticationRepository())),
          BlocProvider<BaseNavigation>(create: (context) => NavigationService()),
        ],
        child: const AuthWrapper(),
      ),
    );
  }
}
