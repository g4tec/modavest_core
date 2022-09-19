// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_table_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePriceTableAdapter extends TypeAdapter<HivePriceTable> {
  @override
  final int typeId = 16;

  @override
  HivePriceTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePriceTable(
      officialStoreId: fields[0] as int?,
      integrationId: fields[1] as int,
      priceTableCode: fields[2] as int,
      stateCode: fields[3] as String?,
      state: fields[4] as String?,
      description: fields[5] as String?,
    )
      ..averagePeriod = (fields[6] as HiveList?)?.castHiveList()
      ..paymentConditions = (fields[7] as HiveList?)?.castHiveList();
  }

  @override
  void write(BinaryWriter writer, HivePriceTable obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.officialStoreId)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.priceTableCode)
      ..writeByte(3)
      ..write(obj.stateCode)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.averagePeriod)
      ..writeByte(7)
      ..write(obj.paymentConditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePriceTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
