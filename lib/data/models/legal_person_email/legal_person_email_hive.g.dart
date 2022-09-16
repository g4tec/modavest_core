// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_person_email_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLegalPersonEmailAdapter extends TypeAdapter<HiveLegalPersonEmail> {
  @override
  final int typeId = 22;

  @override
  HiveLegalPersonEmail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLegalPersonEmail(
      email: fields[0] as String?,
      typeCode: fields[1] as int,
      isDefault: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLegalPersonEmail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.typeCode)
      ..writeByte(2)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLegalPersonEmailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
