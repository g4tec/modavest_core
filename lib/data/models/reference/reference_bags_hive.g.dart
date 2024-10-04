// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_bags_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveReferenceBagsAdapter extends TypeAdapter<HiveReferenceBags> {
  @override
  final int typeId = 50;

  @override
  HiveReferenceBags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveReferenceBags(
      oficialStore: fields[25] as num?,
      priceTable: fields[26] as num?,
      code: fields[0] as String,
      integrationId: fields[1] as int,
      colors: (fields[20] as HiveList?)?.castHiveList(),
      name: fields[6] as String?,
      description: fields[7] as String?,
      descriptive: fields[8] as String?,
      gridCode: fields[9] as int?,
      grid: (fields[10] as List?)?.cast<String>(),
      weight: fields[11] as String?,
      height: fields[12] as String?,
      width: fields[13] as String?,
      length: fields[14] as String?,
      packWeight: fields[15] as String?,
      packHeight: fields[16] as String?,
      packWidth: fields[17] as String?,
      packLength: fields[18] as String?,
      observations: (fields[19] as List?)?.cast<String>(),
      details: (fields[21] as HiveList?)?.castHiveList(),
      composition: (fields[22] as HiveList?)?.castHiveList(),
      imageColorReference: fields[23] as String?,
      referencePrice: fields[24] as HiveReferencePrice?,
      isPack: fields[27] as bool?,
      isGrid: fields[28] as bool?,
      base64: fields[29] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveReferenceBags obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.descriptive)
      ..writeByte(9)
      ..write(obj.gridCode)
      ..writeByte(10)
      ..write(obj.grid)
      ..writeByte(11)
      ..write(obj.weight)
      ..writeByte(12)
      ..write(obj.height)
      ..writeByte(13)
      ..write(obj.width)
      ..writeByte(14)
      ..write(obj.length)
      ..writeByte(15)
      ..write(obj.packWeight)
      ..writeByte(16)
      ..write(obj.packHeight)
      ..writeByte(17)
      ..write(obj.packWidth)
      ..writeByte(18)
      ..write(obj.packLength)
      ..writeByte(19)
      ..write(obj.observations)
      ..writeByte(20)
      ..write(obj.colors)
      ..writeByte(21)
      ..write(obj.details)
      ..writeByte(22)
      ..write(obj.composition)
      ..writeByte(23)
      ..write(obj.imageColorReference)
      ..writeByte(24)
      ..write(obj.referencePrice)
      ..writeByte(25)
      ..write(obj.oficialStore)
      ..writeByte(26)
      ..write(obj.priceTable)
      ..writeByte(27)
      ..write(obj.isPack)
      ..writeByte(28)
      ..write(obj.isGrid)
      ..writeByte(29)
      ..write(obj.base64);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveReferenceBagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
