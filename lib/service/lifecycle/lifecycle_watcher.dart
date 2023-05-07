import 'package:flutter/material.dart';

class LifecycleWatcher extends StatelessWidget {
  final Widget child;
  
  const LifecycleWatcher({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
