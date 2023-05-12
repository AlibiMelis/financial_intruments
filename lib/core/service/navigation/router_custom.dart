import 'package:financial_instruments/core/utils/widgets/not_found_page.dart';
import 'package:financial_instruments/features/dashboard/views/dashboard_page_view.dart';
import 'package:financial_instruments/features/stocks/views/stocks_page.dart';
import 'package:financial_instruments/features/watchlist/views/watchlist_page.dart';
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
      case 'watchlist':
        return MaterialPageRoute(builder: (context) => const WatchlistPage());
      case 'stock_list':
        return MaterialPageRoute(builder: (context) => const StocksPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
