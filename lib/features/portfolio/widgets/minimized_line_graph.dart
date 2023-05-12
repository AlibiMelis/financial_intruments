import 'package:financial_instruments/core/service/stock/model/stock_data_point.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MinimizedLineGraph extends StatelessWidget {
  const MinimizedLineGraph({super.key, required this.points, required this.color});

  final List<MapEntry<String, StockDataPoint>> points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 55,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
          isVisible: false,
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
        ),
        series: <ChartSeries>[
          SplineAreaSeries<MapEntry<String, StockDataPoint>, int>(
            dataSource: points,
            xValueMapper: (point, _) => DateTime.parse(point.key).millisecondsSinceEpoch,
            yValueMapper: (point, _) => point.value.close,
            color: color,
          ),
        ],
      ),
    );
  }
}
