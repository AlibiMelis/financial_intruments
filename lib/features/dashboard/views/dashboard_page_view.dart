import 'package:financial_instruments/features/dashboard/views/home_page.dart';
import 'package:financial_instruments/features/portfolio/views/portfolio_page.dart';
import 'package:flutter/material.dart';

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({super.key, required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        PortfolioPage(),
      ],
    );
  }
}
