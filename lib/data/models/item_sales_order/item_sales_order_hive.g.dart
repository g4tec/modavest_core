// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_sales_order_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveItemSalesOrderAdapter extends TypeAdapter<HiveItemSalesOrder> {
  @override
  final int typeId = 12;

  @override
  HiveItemSalesOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveItemSalesOrder(
      integrationId: fields[0] as int?,
      orderId: fields[1] as String?,
      sequenceItem: fields[2] as num?,
      productCode: fields[3] as num,
      productSku: fields[4] as String?,
      productName: fields[5] as String?,
      referenceCode: fields[6] as String?,
      referenceName: fields[7] as String?,
      colorCode: fields[8] as String?,
      colorName: fields[9] as String?,
      sizeName: fields[10] as String?,
      quantity: fields[11] as num?,
      originalPrice: fields[18] as num?,
      price: fields[19] as num,
      discountPercentage: fields[20] as num?,
      billingForecastDate: fields[21] as DateTime?,
      reference: fields[22] as HiveReference?,
      referenceIsPack: fields[23] as bool?,
      scaleCode: fields[24] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveItemSalesOrder obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.orderId)
      ..writeByte(2)
      ..write(obj.sequenceItem)
      ..writeByte(3)
      ..write(obj.productCode)
      ..writeByte(4)
      ..write(obj.productSku)
      ..writeByte(5)
      ..write(obj.productName)
      ..writeByte(6)
      ..write(obj.referenceCode)
      ..writeByte(7)
      ..write(obj.referenceName)
      ..writeByte(8)
      ..write(obj.colorCode)
      ..writeByte(9)
      ..write(obj.colorName)
      ..writeByte(10)
      ..write(obj.sizeName)
      ..writeByte(11)
      ..write(obj.quantity)
      ..writeByte(18)
      ..write(obj.originalPrice)
      ..writeByte(19)
      ..write(obj.price)
      ..writeByte(20)
      ..write(obj.discountPercentage)
      ..writeByte(21)
      ..write(obj.billingForecastDate)
      ..writeByte(22)
      ..write(obj.reference)
      ..writeByte(23)
      ..write(obj.referenceIsPack)
      ..writeByte(24)
      ..write(obj.scaleCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveItemSalesOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
