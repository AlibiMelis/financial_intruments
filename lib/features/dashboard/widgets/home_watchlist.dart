import 'package:financial_instruments/core/service/stock/cubit/stock_cubit.dart';
import 'package:financial_instruments/core/utils/widgets/section_header.dart';
import 'package:financial_instruments/features/watchlist/widgets/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWatchlist extends StatelessWidget {
  const HomeWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockCubit, StockState>(
      builder: (context, state) {
        if (state is StockLoaded) {
          final stockMap = state.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SectionHeader(title: 'Your Watchlist'),
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
