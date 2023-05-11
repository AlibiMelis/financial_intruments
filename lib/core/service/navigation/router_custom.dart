import 'package:financial_instruments/core/utils/widgets/not_found_page.dart';
import 'package:financial_instruments/features/dashboard/views/dashboard_page_view.dart';
import 'package:flutter/material.dart';

class RouterCustom {
  RouterCustom._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(
          builder: (context) => DashboardPageView(
            tabController: settings.arguments as TabController?,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
