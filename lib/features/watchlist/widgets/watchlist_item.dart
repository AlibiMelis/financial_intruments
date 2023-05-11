import 'package:financial_instruments/core/global/app_color.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.watchlistItemBackground,
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadowColor,
            blurRadius: 4,
          )
        ],
      ),
    );
  }
}
