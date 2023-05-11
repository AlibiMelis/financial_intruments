import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_meta_data.g.dart';

@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'StockMetaDataAdapter')
class StockMetaData {
  @JsonKey(name: '1. Information', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String information;
  @JsonKey(name: '2. Symbol', defaultValue: '')
  @HiveField(2, defaultValue: '')
  final String symbol;
  @JsonKey(name: '3. Last Refreshed')
  @HiveField(3, defaultValue: null)
  final DateTime? lastRefreshed;
  @JsonKey(name: '4. Output Size', defaultValue: '')
  @HiveField(4, defaultValue: '')
  final String outputSize;
  @JsonKey(name: '5. Time Zone', defaultValue: '')
  @HiveField(5, defaultValue: '')
  final String timeZone;

  const StockMetaData({
    required this.information,
    required this.symbol,
    required this.lastRefreshed,
    required this.outputSize,
    required this.timeZone,
  });

  factory StockMetaData.fromJson(Map<String, dynamic> json) => _$StockMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockMetaDataToJson(this);
}
