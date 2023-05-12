import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:financial_instruments/core/utils/widgets/section_header.dart';
import 'package:financial_instruments/core/utils/widgets/see_all_button.dart';
import 'package:flutter/material.dart';

class GainersLosersWidget extends StatelessWidget {
  const GainersLosersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionHeader(title: 'Gainers & Losers'),
              SeeAllButton(
                onTap: () => context.bloc<BaseNavigation>().navigateTo('stock_list'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
