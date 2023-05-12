import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key, required this.onSubmit});
  final Function(String) onSubmit;
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Phone number'),
            controller: _phoneNumberController,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                onSubmit(_phoneNumberController.text);
              }
            },
            child: const Text('Send code'),
          ),
        ],
      ),
    );
  }
}
