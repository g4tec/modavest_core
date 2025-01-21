// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freight_quotes_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFreightQuoteAdapter extends TypeAdapter<HiveFreightQuote> {
  @override
  final int typeId = 55;

  @override
  HiveFreightQuote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFreightQuote(
      freightValue: fields[0] as num,
      shippingCompanyCpfCnpj: fields[1] as String,
      shippingCompanyName: fields[2] as String,
      deliveryEstimateBusinessDays: fields[3] as num,
      deliveryMethodName: fields[4] as String,
      shippingCompanyCode: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveFreightQuote obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.freightValue)
      ..writeByte(1)
      ..write(obj.shippingCompanyCpfCnpj)
      ..writeByte(2)
      ..write(obj.shippingCompanyName)
      ..writeByte(3)
      ..write(obj.deliveryEstimateBusinessDays)
      ..writeByte(4)
      ..write(obj.deliveryMethodName)
      ..writeByte(5)
      ..write(obj.shippingCompanyCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFreightQuoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
