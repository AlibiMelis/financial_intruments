import 'package:financial_instruments/features/login/widgets/otp_input_field.dart';
import 'package:financial_instruments/global/keys.dart';
import 'package:financial_instruments/service/authentication/cubit/authentication_cubit.dart';
import 'package:financial_instruments/utils/extensions.dart';
import 'package:flutter/material.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

  Future<void> _onOTPSubmit(BuildContext context, String otp) async {
    final success = await context.bloc<AuthenticationCubit>().verfiyOTP(otp);
    if (success) {
      Keys.globalNavigationKey.currentState?.pushNamedAndRemoveUntil('dashboard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Verify OTP'),
          OTPInputField(
            onSubmit: (otp) => _onOTPSubmit(context, otp),
          ),
        ],
      ),
    );
  }
}
