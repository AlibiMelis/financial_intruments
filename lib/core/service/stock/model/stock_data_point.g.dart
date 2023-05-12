// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_point.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockDataPointAdapter extends TypeAdapter<StockDataPoint> {
  @override
  final int typeId = 1;

  @override
  StockDataPoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockDataPoint(
      openStr: fields[1] == null ? '' : fields[1] as String,
      highStr: fields[2] == null ? '' : fields[2] as String,
      lowStr: fields[3] == null ? '' : fields[3] as String,
      closeStr: fields[4] == null ? '' : fields[4] as String,
      volumeStr: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StockDataPoint obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.openStr)
      ..writeByte(2)
      ..write(obj.highStr)
      ..writeByte(3)
      ..write(obj.lowStr)
      ..writeByte(4)
      ..write(obj.closeStr)
      ..writeByte(5)
      ..write(obj.volumeStr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockDataPointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDataPoint _$StockDataPointFromJson(Map<String, dynamic> json) =>
    StockDataPoint(
      openStr: json['1. open'] as String? ?? '',
      highStr: json['2. high'] as String? ?? '',
      lowStr: json['3. low'] as String? ?? '',
      closeStr: json['4. close'] as String? ?? '',
      volumeStr: json['5. volume'] as String? ?? '',
    );

Map<String, dynamic> _$StockDataPointToJson(StockDataPoint instance) =>
    <String, dynamic>{
      '1. open': instance.openStr,
      '2. high': instance.highStr,
      '3. low': instance.lowStr,
      '4. close': instance.closeStr,
      '5. volume': instance.volumeStr,
    };
