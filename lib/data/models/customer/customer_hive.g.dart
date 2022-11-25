// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCustomerAdapter extends TypeAdapter<HiveCustomer> {
  @override
  final int typeId = 11;

  @override
  HiveCustomer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCustomer(
      integrationId: fields[0] as int,
      code: fields[1] as int?,
      name: fields[2] as String?,
      cpfCnpj: fields[3] as String?,
      fantasyName: fields[4] as String?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCustomer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.cpfCnpj)
      ..writeByte(4)
      ..write(obj.fantasyName)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
