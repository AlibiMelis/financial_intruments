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
  @JsonKey(name: 'Time Series (5min)', defaultValue: <String, StockDataPoint>{})
  @HiveField(2, defaultValue: null)
  final Map<String, StockDataPoint> timeSeries;

  const StockData({
    required this.metaData,
    required this.timeSeries,
  });

  factory StockData.fromJson(Map<String, dynamic> json) => _$StockDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockDataToJson(this);
}
