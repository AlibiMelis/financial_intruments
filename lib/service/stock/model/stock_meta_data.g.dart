// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockMetaData _$StockMetaDataFromJson(Map<String, dynamic> json) =>
    StockMetaData(
      information: json['1. Information'] as String? ?? '',
      symbol: json['2. Symbol'] as String? ?? '',
      lastRefreshed: json['3. Last Refreshed'] == null
          ? null
          : DateTime.parse(json['3. Last Refreshed'] as String),
      outputSize: json['4. Output Size'] as String? ?? '',
      timeZone: json['5. Time Zone'] as String? ?? '',
    );

Map<String, dynamic> _$StockMetaDataToJson(StockMetaData instance) =>
    <String, dynamic>{
      '1. Information': instance.information,
      '2. Symbol': instance.symbol,
      '3. Last Refreshed': instance.lastRefreshed?.toIso8601String(),
      '4. Output Size': instance.outputSize,
      '5. Time Zone': instance.timeZone,
    };
