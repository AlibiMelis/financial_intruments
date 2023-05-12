import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: const Icon(Icons.more_vert),);
  }
}
