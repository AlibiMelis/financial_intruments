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
      open: fields[1] == null ? 0.0 : fields[1] as double,
      high: fields[2] == null ? 0.0 : fields[2] as double,
      low: fields[3] == null ? 0.0 : fields[3] as double,
      close: fields[4] == null ? 0.0 : fields[4] as double,
      volume: fields[5] == null ? 0 : fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StockDataPoint obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.open)
      ..writeByte(2)
      ..write(obj.high)
      ..writeByte(3)
      ..write(obj.low)
      ..writeByte(4)
      ..write(obj.close)
      ..writeByte(5)
      ..write(obj.volume);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StockDataPointAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDataPoint _$StockDataPointFromJson(Map<String, dynamic> json) => StockDataPoint(
      open: double.tryParse(json['1. open'] as String? ?? '0.0') ?? 0.0,
      high: double.tryParse(json['2. high'] as String? ?? '0.0') ?? 0.0,
      low: double.tryParse(json['3. low'] as String? ?? '0.0') ?? 0.0,
      close: double.tryParse(json['4. close'] as String? ?? '0.0') ?? 0.0,
      volume: int.tryParse(json['5. volume'] as String? ?? '0') ?? 0,
    );

Map<String, dynamic> _$StockDataPointToJson(StockDataPoint instance) => <String, dynamic>{
      '1. open': instance.open,
      '2. high': instance.high,
      '3. low': instance.low,
      '4. close': instance.close,
      '5. volume': instance.volume,
    };
