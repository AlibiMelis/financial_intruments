import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/core/service/stock/cubit/stock_cubit.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:financial_instruments/core/utils/widgets/section_header.dart';
import 'package:financial_instruments/core/utils/widgets/see_all_button.dart';
import 'package:financial_instruments/features/dashboard/widgets/stock_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<StockCubit, StockState>(
            builder: (context, state) {
              if (state is StockLoaded) {
                final stockData = state.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final entry in stockData.entries) ...[
                        StockCard(data: entry.value),
                        const SizedBox(width: 12),
                      ],
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
