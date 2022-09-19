// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBrandAdapter extends TypeAdapter<HiveBrand> {
  @override
  final int typeId = 35;

  @override
  HiveBrand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBrand(
      representativeCode: fields[5] as num,
      brandId: fields[0] as int?,
      brandName: fields[1] as String?,
      brandPhotoUrl: fields[2] as String?,
      brandCreatedAt: fields[3] as String?,
      brandIsActive: fields[4] as bool?,
      classifications: (fields[6] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveBrand obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.brandId)
      ..writeByte(1)
      ..write(obj.brandName)
      ..writeByte(2)
      ..write(obj.brandPhotoUrl)
      ..writeByte(3)
      ..write(obj.brandCreatedAt)
      ..writeByte(4)
      ..write(obj.brandIsActive)
      ..writeByte(5)
      ..write(obj.representativeCode)
      ..writeByte(6)
      ..write(obj.classifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
