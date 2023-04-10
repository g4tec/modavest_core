// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_person_contact_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLegalPersonContactAdapter
    extends TypeAdapter<HiveLegalPersonContact> {
  @override
  final int typeId = 46;

  @override
  HiveLegalPersonContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLegalPersonContact(
      legalPersonCode: fields[0] as num?,
      integrationId: fields[1] as num?,
      sequence: fields[2] as int,
      name: fields[3] as String,
      typeCode: fields[4] as num?,
      typeName: fields[5] as String?,
      function: fields[6] as String?,
      phoneNumber: fields[7] as String?,
      cellNumber: fields[8] as String?,
      email: fields[9] as String?,
      birthDate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLegalPersonContact obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.legalPersonCode)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.sequence)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.typeCode)
      ..writeByte(5)
      ..write(obj.typeName)
      ..writeByte(6)
      ..write(obj.function)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.cellNumber)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.birthDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLegalPersonContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
