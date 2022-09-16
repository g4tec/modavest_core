// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classification_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveClassificationAdapter extends TypeAdapter<HiveClassification> {
  @override
  final int typeId = 2;

  @override
  HiveClassification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveClassification(
      id: fields[0] as int?,
      typeCode: fields[1] as int?,
      typeName: fields[2] as String?,
      typeNameAux: fields[3] as String?,
      code: fields[4] as String?,
      name: fields[5] as String?,
      nameAux: fields[6] as String?,
      subcategoryId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveClassification obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.typeCode)
      ..writeByte(2)
      ..write(obj.typeName)
      ..writeByte(3)
      ..write(obj.typeNameAux)
      ..writeByte(4)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.nameAux)
      ..writeByte(7)
      ..write(obj.subcategoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveClassificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
