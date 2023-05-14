import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/global/app_text_style.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:financial_instruments/core/utils/widgets/options_button.dart';
import 'package:financial_instruments/features/portfolio/widgets/minimized_line_graph.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key, required this.data, this.ticksPerDay = 12});

  final StockData data;
  final int ticksPerDay;

  @override
  Widget build(BuildContext context) {
    final symbol = data.metaData?.symbol ?? '';
    final ticks = data.timeSeries.entries.toList();
    final color = data.absGrowth > 0 ? AppColor.profit : AppColor.loss;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.itemBackground,
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: AppColor.star),
          const SizedBox(width: 10),
          const Icon(Icons.monetization_on),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(symbol, style: AppTextStyle.ticker),
              Text(
                '${data.relGrowth.toStringAsFixed(2)}%',
                style: data.absGrowth > 0 ? AppTextStyle.profitPercentage : AppTextStyle.lossPercentage,
              ),
            ],
          ),
          const SizedBox(width: 10),
          MinimizedLineGraph(points: ticks.sublist(0, ticksPerDay), color: color),
          const Spacer(),
          Text('\$${data.price.toStringAsFixed(2)}'),
          const OptionButton(),
        ],
      ),
    );
  }
}
