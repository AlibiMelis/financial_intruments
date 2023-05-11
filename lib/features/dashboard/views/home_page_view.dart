import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';
import 'package:financial_instruments/core/utils/widgets/page_header.dart';
import 'package:financial_instruments/core/utils/widgets/search_button.dart';
import 'package:financial_instruments/features/dashboard/widgets/dashboard_header.dart';
import 'package:financial_instruments/features/dashboard/widgets/gainers_losers.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.watchlist});

  final Watchlist watchlist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DashboardHeader(),
          const GainersLosersWidget(),
          for (final stock in watchlist.list) Text(stock),
        ],
      ),
    );
  }
}
