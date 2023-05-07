import 'package:financial_instruments/features/dashboard/dashboard_page.dart';
import 'package:financial_instruments/service/lifecycle/lifecycle_watcher_provider.dart';
import 'package:flutter/material.dart';

class NavWrapper extends StatelessWidget {
  const NavWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const LifecycleWatcherProvider(
      child: DashboardPage(),
    );
  }
}
