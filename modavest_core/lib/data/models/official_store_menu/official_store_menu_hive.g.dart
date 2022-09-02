// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_store_menu_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOfficialStoreMenuAdapter extends TypeAdapter<HiveOfficialStoreMenu> {
  @override
  final int typeId = 24;

  @override
  HiveOfficialStoreMenu read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOfficialStoreMenu(
      menuId: fields[1] as int,
      officialStoreId: fields[2] as int,
      description: fields[4] as String?,
      integrationId: fields[3] as int,
    )
      ..classifications = (fields[5] as HiveList).castHiveList()
      ..subMenus = (fields[6] as HiveList).castHiveList();
  }

  @override
  void write(BinaryWriter writer, HiveOfficialStoreMenu obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.menuId)
      ..writeByte(2)
      ..write(obj.officialStoreId)
      ..writeByte(3)
      ..write(obj.integrationId)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.classifications)
      ..writeByte(6)
      ..write(obj.subMenus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOfficialStoreMenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
