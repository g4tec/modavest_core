// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_person_related_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLegalPersonRelatedAdapter
    extends TypeAdapter<HiveLegalPersonRelated> {
  @override
  final int typeId = 54;

  @override
  HiveLegalPersonRelated read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLegalPersonRelated(
      integrationId: fields[3] as int?,
      code: fields[0] as int?,
      cpfCnpj: fields[1] as String?,
      legalPersonCode: fields[2] as int?,
      name: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLegalPersonRelated obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.cpfCnpj)
      ..writeByte(2)
      ..write(obj.legalPersonCode)
      ..writeByte(3)
      ..write(obj.integrationId)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLegalPersonRelatedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
