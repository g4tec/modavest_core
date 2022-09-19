// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDetailAdapter extends TypeAdapter<HiveDetail> {
  @override
  final int typeId = 5;

  @override
  HiveDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDetail(
      integrationId: fields[0] as int,
      referenceCode: fields[6] as String,
      typeCode: fields[1] as int?,
      type: fields[2] as String?,
      auxiliaryType: fields[3] as String?,
      title: fields[4] as String?,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDetail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.typeCode)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.auxiliaryType)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.referenceCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
