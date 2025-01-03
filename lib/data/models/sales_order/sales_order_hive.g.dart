// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSalesOrderAdapter extends TypeAdapter<HiveSalesOrder> {
  @override
  final int typeId = 13;

  @override
  HiveSalesOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSalesOrder(
      integrationId: fields[1] as int?,
      orderId: fields[2] as String?,
      branchCode: fields[3] as num?,
      customerOrderCode: fields[4] as String?,
      integrationCode: fields[5] as String?,
      orderCode: fields[6] as num?,
      orderDate: fields[7] as DateTime?,
      customerCode: fields[8] as num?,
      customerCnpj: fields[9] as String?,
      representativeCode: fields[10] as num?,
      representativeCnpj: fields[11] as String?,
      sellerCode: fields[12] as num?,
      sellerCpf: fields[13] as String?,
      purchasingGuideCode: fields[14] as num?,
      cnpjPurchasingGuide: fields[15] as String?,
      operationCode: fields[16] as num?,
      paymentConditionCode: fields[17] as num?,
      paymentConditionName: fields[18] as String?,
      quantity: fields[19] as double?,
      grossValue: fields[20] as double?,
      discountValue: fields[21] as num?,
      netValue: fields[22] as double?,
      priorityCode: fields[23] as num?,
      shippingCompanyCode: fields[24] as num?,
      shippingCompanyCpfCnpj: fields[25] as String?,
      billingForecastDate: fields[26] as DateTime?,
      freightType: fields[27] as num?,
      freightPercentage: fields[28] as double?,
      freightValue: fields[29] as double?,
      packageint: fields[30] as double?,
      weight: fields[31] as double?,
      totalAmountOrder: fields[32] as double?,
      statusOrder: fields[33] as String?,
      items: (fields[34] as HiveList?)?.castHiveList(),
      customerName: fields[35] as String?,
      officialStoreId: fields[36] as num,
      priceTableCode: fields[37] as num?,
      totalOriginalAmountOrder: fields[39] as double?,
      discountPercentage: fields[40] as num?,
      arrivalDate: fields[42] as DateTime?,
      shippingCompanyName: fields[43] as String?,
      status: fields[44] as String?,
      shippingAddress: (fields[45] as HiveList?)?.castHiveList(),
      officialStoreSalesQuestions: (fields[46] as HiveList?)?.castHiveList(),
      outsourceds: fields[47] as String?,
      outsourcedsName: fields[48] as String?,
    )
      ..discounts = (fields[38] as HiveList?)?.castHiveList()
      ..observations = (fields[41] as List?)?.cast<String?>();
  }

  @override
  void write(BinaryWriter writer, HiveSalesOrder obj) {
    writer
      ..writeByte(48)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.orderId)
      ..writeByte(3)
      ..write(obj.branchCode)
      ..writeByte(4)
      ..write(obj.customerOrderCode)
      ..writeByte(5)
      ..write(obj.integrationCode)
      ..writeByte(6)
      ..write(obj.orderCode)
      ..writeByte(7)
      ..write(obj.orderDate)
      ..writeByte(8)
      ..write(obj.customerCode)
      ..writeByte(9)
      ..write(obj.customerCnpj)
      ..writeByte(10)
      ..write(obj.representativeCode)
      ..writeByte(11)
      ..write(obj.representativeCnpj)
      ..writeByte(12)
      ..write(obj.sellerCode)
      ..writeByte(13)
      ..write(obj.sellerCpf)
      ..writeByte(14)
      ..write(obj.purchasingGuideCode)
      ..writeByte(15)
      ..write(obj.cnpjPurchasingGuide)
      ..writeByte(16)
      ..write(obj.operationCode)
      ..writeByte(17)
      ..write(obj.paymentConditionCode)
      ..writeByte(18)
      ..write(obj.paymentConditionName)
      ..writeByte(19)
      ..write(obj.quantity)
      ..writeByte(20)
      ..write(obj.grossValue)
      ..writeByte(21)
      ..write(obj.discountValue)
      ..writeByte(22)
      ..write(obj.netValue)
      ..writeByte(23)
      ..write(obj.priorityCode)
      ..writeByte(24)
      ..write(obj.shippingCompanyCode)
      ..writeByte(25)
      ..write(obj.shippingCompanyCpfCnpj)
      ..writeByte(26)
      ..write(obj.billingForecastDate)
      ..writeByte(27)
      ..write(obj.freightType)
      ..writeByte(28)
      ..write(obj.freightPercentage)
      ..writeByte(29)
      ..write(obj.freightValue)
      ..writeByte(30)
      ..write(obj.packageint)
      ..writeByte(31)
      ..write(obj.weight)
      ..writeByte(32)
      ..write(obj.totalAmountOrder)
      ..writeByte(33)
      ..write(obj.statusOrder)
      ..writeByte(35)
      ..write(obj.customerName)
      ..writeByte(34)
      ..write(obj.items)
      ..writeByte(36)
      ..write(obj.officialStoreId)
      ..writeByte(37)
      ..write(obj.priceTableCode)
      ..writeByte(38)
      ..write(obj.discounts)
      ..writeByte(39)
      ..write(obj.totalOriginalAmountOrder)
      ..writeByte(40)
      ..write(obj.discountPercentage)
      ..writeByte(41)
      ..write(obj.observations)
      ..writeByte(42)
      ..write(obj.arrivalDate)
      ..writeByte(43)
      ..write(obj.shippingCompanyName)
      ..writeByte(44)
      ..write(obj.status)
      ..writeByte(45)
      ..write(obj.shippingAddress)
      ..writeByte(46)
      ..write(obj.officialStoreSalesQuestions)
      ..writeByte(47)
      ..write(obj.outsourceds)
      ..writeByte(48)
      ..write(obj.outsourcedsName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSalesOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
