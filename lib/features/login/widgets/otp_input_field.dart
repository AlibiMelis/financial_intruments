import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPInputField extends StatelessWidget {
  final Function(String) onSubmit; 
  const OTPInputField({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      onSubmit: onSubmit,
    );
  }
}
