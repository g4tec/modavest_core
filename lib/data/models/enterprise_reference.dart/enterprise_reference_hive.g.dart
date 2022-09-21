// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_reference_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveEnterpriseReferenceAdapter
    extends TypeAdapter<HiveEnterpriseReference> {
  @override
  final int typeId = 47;

  @override
  HiveEnterpriseReference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveEnterpriseReference(
      phoneNumber: fields[1] as String?,
      name: fields[2] as String?,
      description: fields[4] as String?,
      typeReference: fields[3] as String?,
      sequence: fields[0] as int?,
      integrationId: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveEnterpriseReference obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.sequence)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.typeReference)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.integrationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveEnterpriseReferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
