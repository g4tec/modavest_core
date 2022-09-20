// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOptionsAdapter extends TypeAdapter<HiveOptions> {
  @override
  final int typeId = 31;

  @override
  HiveOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOptions(
      observation: fields[0] as String?,
      officialStoreId: fields[1] as num,
      questionId: fields[2] as num,
      sequence: fields[3] as num,
      option: fields[4] as String,
      definedField: fields[5] as String?,
      definedFieldValue: fields[6] as String?,
      definedFieldType: fields[7] as String?,
      typeCode: fields[8] as num?,
      code: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveOptions obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.observation)
      ..writeByte(1)
      ..write(obj.officialStoreId)
      ..writeByte(2)
      ..write(obj.questionId)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.option)
      ..writeByte(5)
      ..write(obj.definedField)
      ..writeByte(6)
      ..write(obj.definedFieldValue)
      ..writeByte(7)
      ..write(obj.definedFieldType)
      ..writeByte(8)
      ..write(obj.typeCode)
      ..writeByte(9)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
