import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data_point.dart';
import 'package:financial_instruments/core/service/stock/model/stock_meta_data.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_data.g.dart';

@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'StockDataAdapter')
class StockData {
  @JsonKey(name: 'Meta Data', defaultValue: null)
  @HiveField(1, defaultValue: null)
  final StockMetaData? metaData;
  @JsonKey(name: 'Time Series ($alphaInterval)', defaultValue: <String, StockDataPoint>{})
  @HiveField(2, defaultValue: null)
  final Map<String, StockDataPoint> timeSeries;
  @HiveField(3, defaultValue: 0.0)
  late final double absGrowth;
  @HiveField(4, defaultValue: 0.0)
  late final double relGrowth;
  @HiveField(5, defaultValue: 0.0)
  late final double price;

  StockData({
    required this.metaData,
    required this.timeSeries,
  }) {
    final ticks = timeSeries.entries.toList();
    const ticksPerDay = 12;

    if (ticks.length >= ticksPerDay) {
      final today = ticks[0].value.close;
      final yesterday = ticks[ticksPerDay].value.close;
      absGrowth = today - yesterday;
      relGrowth = absGrowth / yesterday;
      price = today;
    } else {
      absGrowth = 0.0;
      relGrowth = 0.0;
      price = 0.0;
    }
  }

  String getPrettyAbsGrowth() {
    final sign = absGrowth < 0 ? '-' : '';
    final abs = absGrowth.abs();
    return '$sign\$${abs.toStringAsFixed(2)}';
  }

  factory StockData.fromJson(Map<String, dynamic> json) => _$StockDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockDataToJson(this);
}
