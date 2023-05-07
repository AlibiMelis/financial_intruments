import 'package:financial_instruments/service/lifecycle/lifecycle_watcher.dart';
import 'package:flutter/material.dart';

class LifecycleWatcherProvider extends StatelessWidget {
  final Widget child;

  const LifecycleWatcherProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LifecycleWatcher(child: child);
  }
}
