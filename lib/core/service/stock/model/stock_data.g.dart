// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockDataAdapter extends TypeAdapter<StockData> {
  @override
  final int typeId = 3;

  @override
  StockData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockData(
      metaData: fields[1] as StockMetaData?,
      timeSeries: (fields[2] as Map).cast<String, StockDataPoint>(),
    );
  }

  @override
  void write(BinaryWriter writer, StockData obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.metaData)
      ..writeByte(2)
      ..write(obj.timeSeries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      metaData: json['Meta Data'] == null
          ? null
          : StockMetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
      timeSeries: (json['Time Series (60min)'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, StockDataPoint.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'Meta Data': instance.metaData,
      'Time Series (60min)': instance.timeSeries,
    };
