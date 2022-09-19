// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveScaleAdapter extends TypeAdapter<HiveScale> {
  @override
  final int typeId = 40;

  @override
  HiveScale read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveScale(
      scaleCode: fields[0] as num,
      integrationId: fields[1] as num,
      code: fields[2] as num,
      sequence: fields[3] as num?,
      quantity: fields[4] as num?,
      variationValue: fields[5] as num?,
      variationPercentage: fields[6] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveScale obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.scaleCode)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.variationValue)
      ..writeByte(6)
      ..write(obj.variationPercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveScaleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
