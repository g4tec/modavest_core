// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_price_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveReferencePriceAdapter extends TypeAdapter<HiveReferencePrice> {
  @override
  final int typeId = 33;

  @override
  HiveReferencePrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveReferencePrice(
      referenceCode: fields[0] as String?,
      min: fields[1] as num?,
      prices: (fields[2] as HiveList?)?.castHiveList(),
      priceTableCode: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, HiveReferencePrice obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.referenceCode)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.prices)
      ..writeByte(3)
      ..write(obj.priceTableCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveReferencePriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
