// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_person_phone_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLegalPersonPhoneAdapter extends TypeAdapter<HiveLegalPersonPhone> {
  @override
  final int typeId = 26;

  @override
  HiveLegalPersonPhone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLegalPersonPhone(
      typeCode: fields[0] as int,
      number: fields[1] as String?,
      branchLine: fields[2] as int?,
      isDefault: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLegalPersonPhone obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.typeCode)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.branchLine)
      ..writeByte(3)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLegalPersonPhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
