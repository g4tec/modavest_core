// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'composition_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCompositionAdapter extends TypeAdapter<HiveComposition> {
  @override
  final int typeId = 4;

  @override
  HiveComposition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveComposition(
      referenceCode: fields[0] as String,
      integrationId: fields[1] as int,
      material: fields[2] as String,
      percentage: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveComposition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.referenceCode)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.material)
      ..writeByte(3)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCompositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
