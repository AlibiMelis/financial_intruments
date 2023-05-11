// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDataPoint _$StockDataPointFromJson(Map<String, dynamic> json) =>
    StockDataPoint(
      open: double.tryParse(json['1. open'] as String) ?? 0.0,
      high: double.tryParse(json['2. high'] as String) ?? 0.0,
      low: double.tryParse(json['3. low'] as String) ?? 0.0,
      close: double.tryParse(json['4. close'] as String) ?? 0.0,
      volume: int.tryParse(json['5. volume'] as String) ?? 0,
    );

Map<String, dynamic> _$StockDataPointToJson(StockDataPoint instance) =>
    <String, dynamic>{
      '1. open': instance.open,
      '2. high': instance.high,
      '3. low': instance.low,
      '4. close': instance.close,
      '5. volume': instance.volume,
    };
