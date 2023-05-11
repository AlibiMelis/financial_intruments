// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainUserAdapter extends TypeAdapter<MainUser> {
  @override
  final int typeId = 4;

  @override
  MainUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainUser(
      phoneNumber: fields[1] == null ? '' : fields[1] as String,
      uid: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MainUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUser _$MainUserFromJson(Map<String, dynamic> json) => MainUser(
      phoneNumber: json['phoneNumber'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
    );

Map<String, dynamic> _$MainUserToJson(MainUser instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'uid': instance.uid,
    };
