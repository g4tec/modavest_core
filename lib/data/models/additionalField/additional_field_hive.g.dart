// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_field_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAdditionalFieldAdapter extends TypeAdapter<HiveAdditionalField> {
  @override
  final int typeId = 0;

  @override
  HiveAdditionalField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAdditionalField(
      id: fields[0] as int,
      code: fields[1] as int?,
      name: fields[2] as String?,
      type: fields[3] as String?,
      value: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAdditionalField obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAdditionalFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
