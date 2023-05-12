import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_data_point.g.dart';

@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'StockDataPointAdapter')
class StockDataPoint {
  @JsonKey(name: '1. open', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String openStr;
  @JsonKey(name: '2. high', defaultValue: '')
  @HiveField(2, defaultValue: '')
  final String highStr;
  @JsonKey(name: '3. low', defaultValue: '')
  @HiveField(3, defaultValue: '')
  final String lowStr;
  @JsonKey(name: '4. close', defaultValue: '')
  @HiveField(4, defaultValue: '')
  final String closeStr;
  @JsonKey(name: '5. volume', defaultValue: '')
  @HiveField(5, defaultValue: '')
  final String volumeStr;

  const StockDataPoint({
    required this.openStr,
    required this.highStr,
    required this.lowStr,
    required this.closeStr,
    required this.volumeStr,
  });

  double get open => double.tryParse(openStr) ?? 0.0;
  double get high => double.tryParse(highStr) ?? 0.0;
  double get low => double.tryParse(lowStr) ?? 0.0;
  double get close => double.tryParse(closeStr) ?? 0.0;
  int get volume => int.tryParse(volumeStr) ?? 0;


  factory StockDataPoint.fromJson(Map<String, dynamic> json) => _$StockDataPointFromJson(json);
  Map<String, dynamic> toJson() => _$StockDataPointToJson(this);
}
