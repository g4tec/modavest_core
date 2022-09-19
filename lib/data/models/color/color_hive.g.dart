// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveColorAdapter extends TypeAdapter<HiveColor> {
  @override
  final int typeId = 3;

  @override
  HiveColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveColor(
      integrationId: fields[0] as int?,
      code: fields[1] as String,
      referenceCode: fields[8] as String?,
      name: fields[2] as String?,
      groupName: fields[3] as String?,
      auxiliaryCode: fields[4] as String?,
      auxiliaryName: fields[5] as String?,
      pantoneCode: fields[6] as String?,
      products: (fields[7] as HiveList?)?.castHiveList(),
      imgList: (fields[26] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveColor obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.groupName)
      ..writeByte(4)
      ..write(obj.auxiliaryCode)
      ..writeByte(5)
      ..write(obj.auxiliaryName)
      ..writeByte(6)
      ..write(obj.pantoneCode)
      ..writeByte(7)
      ..write(obj.products)
      ..writeByte(26)
      ..write(obj.imgList)
      ..writeByte(8)
      ..write(obj.referenceCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
