// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      metaData: json['Meta Data'] == null
          ? null
          : StockMetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
      timeSeries: (json['Time Series (5min)'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, StockDataPoint.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'Meta Data': instance.metaData,
      'Time Series (5min)': instance.timeSeries,
    };
