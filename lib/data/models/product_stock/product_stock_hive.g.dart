// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductStockAdapter extends TypeAdapter<HiveProductStock> {
  @override
  final int typeId = 49;

  @override
  HiveProductStock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProductStock(
      integrationId: fields[0] as num,
      officialStoreId: fields[1] as num,
      productCode: fields[2] as num,
      stock: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProductStock obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.officialStoreId)
      ..writeByte(2)
      ..write(obj.productCode)
      ..writeByte(3)
      ..write(obj.stock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductStockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
