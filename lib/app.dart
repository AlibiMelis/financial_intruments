import 'package:financial_instruments/features/wrapper/auth_wrapper.dart';
import 'package:financial_instruments/service/authentication/cubit/authentication_cubit.dart';
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
          BlocProvider<AuthenticationCubit>(create: (context) => AuthenticationCubit()),
        ],
        child: const AuthWrapper(),
      ),
    );
  }
}
