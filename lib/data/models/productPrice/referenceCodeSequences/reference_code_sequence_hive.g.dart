// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_code_sequence_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveReferenceCodeSequenceAdapter
    extends TypeAdapter<HiveReferenceCodeSequence> {
  @override
  final int typeId = 9;

  @override
  HiveReferenceCodeSequence read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveReferenceCodeSequence(
      id: fields[0] as int,
      code: fields[1] as String?,
      name: fields[2] as String?,
      referenceId: fields[3] as int?,
      parentCode: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveReferenceCodeSequence obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.referenceId)
      ..writeByte(4)
      ..write(obj.parentCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveReferenceCodeSequenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
