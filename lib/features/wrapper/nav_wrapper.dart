import 'package:financial_instruments/core/service/lifecycle/lifecycle_watcher_provider.dart';
import 'package:financial_instruments/features/dashboard/views/dashboard_page.dart';
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
