import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/core/service/stock/cubit/stock_cubit.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:financial_instruments/core/utils/widgets/section_header.dart';
import 'package:financial_instruments/core/utils/widgets/see_all_button.dart';
import 'package:financial_instruments/features/watchlist/widgets/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWatchlist extends StatelessWidget {
  const HomeWatchlist({super.key, required this.watchlist});

  final List<String> watchlist;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockCubit, StockState>(
      builder: (context, state) {
        if (state is StockLoaded) {
          final stockMap = state.data;
          stockMap.removeWhere((key, _) => !watchlist.contains(key));
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeader(title: 'Your Watchlist'),
                    SeeAllButton(
                      onTap: () => context.bloc<BaseNavigation>().navigateTo('watchlist'),
                    ),
                  ],
                ),
                for (final stockData in stockMap.values) ...[
                  const SizedBox(height: 14),
                  WatchlistItem(data: stockData),
                ],
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
