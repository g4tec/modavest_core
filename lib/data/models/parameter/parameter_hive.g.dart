// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveParameterAdapter extends TypeAdapter<HiveParameter> {
  @override
  final int typeId = 51;

  @override
  HiveParameter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveParameter(
      parameterId: fields[0] as num?,
      value: fields[1] as String?,
      code: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveParameter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.parameterId)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveParameterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
