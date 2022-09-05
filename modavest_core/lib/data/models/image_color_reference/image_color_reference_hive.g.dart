// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_color_reference_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveImageColorReferenceAdapter
    extends TypeAdapter<HiveImageColorReference> {
  @override
  final int typeId = 39;

  @override
  HiveImageColorReference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveImageColorReference(
      sequence: fields[0] as String,
      image: fields[1] as String?,
      imageMedium: fields[2] as String?,
      imageSmall: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveImageColorReference obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.sequence)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.imageMedium)
      ..writeByte(3)
      ..write(obj.imageSmall);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveImageColorReferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
