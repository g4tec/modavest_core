// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_table_scales_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePriceTableScalesAdapter extends TypeAdapter<HivePriceTableScales> {
  @override
  final int typeId = 42;

  @override
  HivePriceTableScales read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePriceTableScales(
      scaleCode: fields[0] as num,
      integrationId: fields[1] as num,
      headerCode: fields[2] as num,
      scaleDescription: fields[3] as String?,
      scales: (fields[4] as HiveList?)?.castHiveList(),
      priceTableCode: fields[5] as num,
      param: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePriceTableScales obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.scaleCode)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.headerCode)
      ..writeByte(3)
      ..write(obj.scaleDescription)
      ..writeByte(4)
      ..write(obj.scales)
      ..writeByte(5)
      ..write(obj.priceTableCode)
      ..writeByte(6)
      ..write(obj.param);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePriceTableScalesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
