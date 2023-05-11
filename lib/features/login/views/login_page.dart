import 'package:financial_instruments/core/global/keys.dart';
import 'package:financial_instruments/core/service/authentication/cubit/authentication_cubit.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:financial_instruments/features/login/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future onFormSubmit(BuildContext context, String phoneNo) async {
    await context.bloc<BaseAuthentication>().sendOTP(phoneNo);
    if (context.mounted) {
      Keys.globalNavigationKey.currentState?.pushNamed('otp_verification');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignUpForm(onSubmit: (phoneNo) => onFormSubmit(context, phoneNo)),
          ],
        ),
      ),
    );
  }
}
