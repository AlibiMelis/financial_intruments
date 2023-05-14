import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/global/app_text_style.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key, required this.data});

  final StockData data;

  @override
  Widget build(BuildContext context) {
    final color = data.absGrowth > 0 ? AppColor.profit : AppColor.loss;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.itemBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.money, size: 24),
          Text(data.metaData?.symbol ?? ''),
          Text(
            data.price.toStringAsFixed(2),
            style: AppTextStyle.absGrowth.copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${data.relGrowth.toStringAsFixed(2)}%',
                  style: data.absGrowth > 0 ? AppTextStyle.profitPercentage : AppTextStyle.lossPercentage,
                ),
              ),
              const SizedBox(width: 8),
              Text(data.getPrettyAbsGrowth(), style: AppTextStyle.absGrowth),
            ],
          )
        ],
      ),
    );
  }
}
