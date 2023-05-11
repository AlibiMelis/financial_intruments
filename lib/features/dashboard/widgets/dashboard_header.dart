import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/utils/widgets/page_header.dart';
import 'package:financial_instruments/core/utils/widgets/search_button.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, bottom: 60, right: 16),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColor.shadowColor,
          ),
        ],
        color: AppColor.pageHeaderBackground,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageHeader(title: 'Dashboard'),
            SearchButton(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
