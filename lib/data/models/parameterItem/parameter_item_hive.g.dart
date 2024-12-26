// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_item_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveParameterItemAdapter extends TypeAdapter<HiveParameterItem> {
  @override
  final int typeId = 52;

  @override
  HiveParameterItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveParameterItem(
      integrationId: fields[0] as num?,
      value: fields[1] as String?,
      variant: fields[2] as String?,
      parameter: fields[3] as HiveParameter?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveParameterItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.variant)
      ..writeByte(3)
      ..write(obj.parameter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveParameterItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
