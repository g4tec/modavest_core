// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_conditions_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePaymentConditionsAdapter extends TypeAdapter<HivePaymentConditions> {
  @override
  final int typeId = 32;

  @override
  HivePaymentConditions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePaymentConditions(
      code: fields[0] as num,
      name: fields[1] as String,
      installment: fields[2] as String?,
      interestPercentage: fields[4] as String?,
      isBlocked: fields[5] as bool?,
      isActive: fields[6] as bool?,
      installmentDays: (fields[7] as List?)?.cast<String?>(),
      priceTable: fields[8] as num?,
      officialStore: fields[9] as num?,
      isDefault: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HivePaymentConditions obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.installment)
      ..writeByte(4)
      ..write(obj.interestPercentage)
      ..writeByte(5)
      ..write(obj.isBlocked)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.installmentDays)
      ..writeByte(8)
      ..write(obj.priceTable)
      ..writeByte(9)
      ..write(obj.officialStore)
      ..writeByte(10)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePaymentConditionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
