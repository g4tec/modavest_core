// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_social_network_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveEnterpriseSocialNetworkAdapter
    extends TypeAdapter<HiveEnterpriseSocialNetwork> {
  @override
  final int typeId = 48;

  @override
  HiveEnterpriseSocialNetwork read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveEnterpriseSocialNetwork(
      address: fields[2] as String?,
      integrationId: fields[1] as num?,
      typeName: fields[4] as String?,
      typeCode: fields[3] as num?,
      sequence: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveEnterpriseSocialNetwork obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sequence)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.typeCode)
      ..writeByte(4)
      ..write(obj.typeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveEnterpriseSocialNetworkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
