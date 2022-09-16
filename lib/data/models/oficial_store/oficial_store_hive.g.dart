// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oficial_store_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOficialStoreAdapter extends TypeAdapter<HiveOficialStore> {
  @override
  final int typeId = 14;

  @override
  HiveOficialStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOficialStore(
      integrationId: fields[1] as num,
      officialStoreId: fields[2] as num,
      description: fields[3] as String,
      isDeliveryImmediately: fields[4] as bool,
      isMakeToOrder: fields[5] as bool,
      isVisibleCustomer: fields[6] as bool,
      isVisibleRepresentative: fields[7] as bool,
      isVisibleSeller: fields[8] as bool,
      minimumCifValue: fields[9] as num?,
      logoUrl: fields[10] as String?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
    )
      ..priceTables = (fields[13] as HiveList).castHiveList()
      ..discount = (fields[14] as HiveList).castHiveList()
      ..paymentConditions = (fields[15] as HiveList).castHiveList();
  }

  @override
  void write(BinaryWriter writer, HiveOficialStore obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.officialStoreId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.isDeliveryImmediately)
      ..writeByte(5)
      ..write(obj.isMakeToOrder)
      ..writeByte(6)
      ..write(obj.isVisibleCustomer)
      ..writeByte(7)
      ..write(obj.isVisibleRepresentative)
      ..writeByte(8)
      ..write(obj.isVisibleSeller)
      ..writeByte(9)
      ..write(obj.minimumCifValue)
      ..writeByte(10)
      ..write(obj.logoUrl)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.priceTables)
      ..writeByte(14)
      ..write(obj.discount)
      ..writeByte(15)
      ..write(obj.paymentConditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOficialStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
