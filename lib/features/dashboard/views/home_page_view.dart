import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';
import 'package:financial_instruments/features/dashboard/widgets/dashboard_header.dart';
import 'package:financial_instruments/features/dashboard/widgets/gainers_losers.dart';
import 'package:financial_instruments/features/dashboard/widgets/home_watchlist.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.watchlist});

  final Watchlist watchlist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          DashboardHeader(),
          GainersLosersWidget(),
          HomeWatchlist(),
        ],
      ),
    );
  }
}
