// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_meta_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockMetaDataAdapter extends TypeAdapter<StockMetaData> {
  @override
  final int typeId = 2;

  @override
  StockMetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockMetaData(
      information: fields[1] == null ? '' : fields[1] as String,
      symbol: fields[2] == null ? '' : fields[2] as String,
      lastRefreshed: fields[3] as DateTime?,
      outputSize: fields[4] == null ? '' : fields[4] as String,
      timeZone: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StockMetaData obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.information)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.lastRefreshed)
      ..writeByte(4)
      ..write(obj.outputSize)
      ..writeByte(5)
      ..write(obj.timeZone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockMetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
