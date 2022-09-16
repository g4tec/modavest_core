// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCategoryAdapter extends TypeAdapter<HiveCategory> {
  @override
  final int typeId = 1;

  @override
  HiveCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCategory(
      categoryId: fields[0] as int?,
      description: fields[1] as String?,
      categoryPhotoUrl: fields[2] as String?,
      classifications: (fields[3] as HiveList?)?.castHiveList(),
      subCategories: (fields[4] as HiveList?)?.castHiveList(),
      isSubcategory: fields[5] as bool,
      isStyle: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCategory obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.categoryPhotoUrl)
      ..writeByte(3)
      ..write(obj.classifications)
      ..writeByte(4)
      ..write(obj.subCategories)
      ..writeByte(5)
      ..write(obj.isSubcategory)
      ..writeByte(6)
      ..write(obj.isStyle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
