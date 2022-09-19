// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductPriceAdapter extends TypeAdapter<HiveProductPrice> {
  @override
  final int typeId = 27;

  @override
  HiveProductPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProductPrice(
      productCode: fields[0] as num?,
      originalPrice: fields[1] as num?,
      branchCode: fields[2] as num?,
      price: fields[3] as num?,
      referenceCode: fields[4] as String,
      scaleCode: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProductPrice obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productCode)
      ..writeByte(1)
      ..write(obj.originalPrice)
      ..writeByte(2)
      ..write(obj.branchCode)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.referenceCode)
      ..writeByte(5)
      ..write(obj.scaleCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
