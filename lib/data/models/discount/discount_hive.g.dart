// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDiscountAdapter extends TypeAdapter<HiveDiscount> {
  @override
  final int typeId = 28;

  @override
  HiveDiscount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDiscount(
      code: fields[0] as num,
      percentage: fields[1] as num,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDiscount obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDiscountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
