import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_data_point.g.dart';

@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'StockDataPointAdapter')
class StockDataPoint {
  @JsonKey(name: '1. open', defaultValue: 0.0)
  @HiveField(1, defaultValue: 0.0)
  final double open;
  @JsonKey(name: '2. high', defaultValue: 0.0)
  @HiveField(2, defaultValue: 0.0)
  final double high;
  @JsonKey(name: '3. low', defaultValue: 0.0)
  @HiveField(3, defaultValue: 0.0)
  final double low;
  @JsonKey(name: '4. close', defaultValue: 0.0)
  @HiveField(4, defaultValue: 0.0)
  final double close;
  @JsonKey(name: '5. volume', defaultValue: 0)
  @HiveField(5, defaultValue: 0.0)
  final int volume;

  const StockDataPoint({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory StockDataPoint.fromJson(Map<String, dynamic> json) => _$StockDataPointFromJson(json);
  Map<String, dynamic> toJson() => _$StockDataPointToJson(this);
}
