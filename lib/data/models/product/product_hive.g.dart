// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductAdapter extends TypeAdapter<HiveProduct> {
  @override
  final int typeId = 6;

  @override
  HiveProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProduct(
      referenceCode: fields[0] as String?,
      code: fields[1] as num,
      integrationId: fields[2] as int?,
      colorCode: fields[3] as String,
      sku: fields[4] as String?,
      name: fields[5] as String?,
      ncm: fields[6] as String?,
      cst: fields[7] as String?,
      measuredUnit: fields[8] as String?,
      size: fields[9] as String?,
      isActive: fields[10] as bool?,
      isFinishedProduct: fields[11] as bool?,
      isRawMaterial: fields[12] as bool?,
      isBulkMaterial: fields[13] as bool?,
      isOwnProduction: fields[14] as bool?,
      minimumStockAmount: fields[15] as double?,
      maximumStockAmount: fields[16] as double?,
      idealStockAmount: fields[17] as double?,
      salesStartDate: fields[18] as String?,
      salesEndDate: fields[19] as String?,
      barCodes: (fields[20] as List?)?.cast<String>(),
      classifications: (fields[21] as HiveList?)?.castHiveList(),
      additionalFields: (fields[22] as HiveList?)?.castHiveList(),
      productManufacturers: (fields[24] as HiveList?)?.castHiveList(),
      referenceCodeSequences: (fields[25] as HiveList?)?.castHiveList(),
      suppliers: (fields[23] as HiveList?)?.castHiveList(),
      price: fields[27] as double?,
      originalPrice: fields[26] as double?,
      packAmount: fields[28] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProduct obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.referenceCode)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.integrationId)
      ..writeByte(3)
      ..write(obj.colorCode)
      ..writeByte(4)
      ..write(obj.sku)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.ncm)
      ..writeByte(7)
      ..write(obj.cst)
      ..writeByte(8)
      ..write(obj.measuredUnit)
      ..writeByte(9)
      ..write(obj.size)
      ..writeByte(10)
      ..write(obj.isActive)
      ..writeByte(11)
      ..write(obj.isFinishedProduct)
      ..writeByte(12)
      ..write(obj.isRawMaterial)
      ..writeByte(13)
      ..write(obj.isBulkMaterial)
      ..writeByte(14)
      ..write(obj.isOwnProduction)
      ..writeByte(15)
      ..write(obj.minimumStockAmount)
      ..writeByte(16)
      ..write(obj.maximumStockAmount)
      ..writeByte(17)
      ..write(obj.idealStockAmount)
      ..writeByte(18)
      ..write(obj.salesStartDate)
      ..writeByte(19)
      ..write(obj.salesEndDate)
      ..writeByte(20)
      ..write(obj.barCodes)
      ..writeByte(21)
      ..write(obj.classifications)
      ..writeByte(22)
      ..write(obj.additionalFields)
      ..writeByte(23)
      ..write(obj.suppliers)
      ..writeByte(24)
      ..write(obj.productManufacturers)
      ..writeByte(25)
      ..write(obj.referenceCodeSequences)
      ..writeByte(26)
      ..write(obj.originalPrice)
      ..writeByte(27)
      ..write(obj.price)
      ..writeByte(28)
      ..write(obj.packAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
