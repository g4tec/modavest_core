// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_period_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAveragePeriodAdapter extends TypeAdapter<HiveAveragePeriod> {
  @override
  final int typeId = 45;

  @override
  HiveAveragePeriod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAveragePeriod(
      priceTableCode: fields[0] as num,
      integrationId: fields[1] as num,
      sequence: fields[2] as num,
      quantity: fields[3] as num?,
      state: fields[4] as num?,
      variationPercentage: fields[5] as num?,
      variationValue: fields[6] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAveragePeriod obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.priceTableCode)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.sequence)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.variationPercentage)
      ..writeByte(6)
      ..write(obj.variationValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAveragePeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
