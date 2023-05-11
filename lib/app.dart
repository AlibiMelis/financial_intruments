import 'package:financial_instruments/core/service/authentication/cubit/authentication_cubit.dart';
import 'package:financial_instruments/core/service/authentication/repository/authentication_repo.dart';
import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/features/wrapper/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BaseAuthentication>(create: (context) => AuthenticationCubit(repository: AuthenticationRepositoryImpl())),
          BlocProvider<BaseNavigation>(create: (context) => NavigationService()),
        ],
        child: const AuthWrapper(),
      ),
    );
  }
}
