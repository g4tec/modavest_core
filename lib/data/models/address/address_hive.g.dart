// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAddressAdapter extends TypeAdapter<HiveAddress> {
  @override
  final int typeId = 23;

  @override
  HiveAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAddress(
      addressType: fields[0] as num,
      integrationId: fields[1] as num?,
      publicPlace: fields[2] as String?,
      address: fields[3] as String,
      number: fields[4] as num?,
      complement: fields[5] as String?,
      neighborhood: fields[6] as String?,
      ibgeCityCode: fields[7] as num?,
      cityName: fields[8] as String,
      stateAbbreviation: fields[9] as String?,
      cep: fields[10] as String,
      bcbCountryCode: fields[11] as num?,
      countryName: fields[12] as String,
      postOfficeBox: fields[13] as num?,
      reference: fields[14] as String?,
      branchInsertCode: fields[15] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAddress obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.addressType)
      ..writeByte(1)
      ..write(obj.integrationId)
      ..writeByte(2)
      ..write(obj.publicPlace)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.number)
      ..writeByte(5)
      ..write(obj.complement)
      ..writeByte(6)
      ..write(obj.neighborhood)
      ..writeByte(7)
      ..write(obj.ibgeCityCode)
      ..writeByte(8)
      ..write(obj.cityName)
      ..writeByte(9)
      ..write(obj.stateAbbreviation)
      ..writeByte(10)
      ..write(obj.cep)
      ..writeByte(11)
      ..write(obj.bcbCountryCode)
      ..writeByte(12)
      ..write(obj.countryName)
      ..writeByte(13)
      ..write(obj.postOfficeBox)
      ..writeByte(14)
      ..write(obj.reference)
      ..writeByte(15)
      ..write(obj.branchInsertCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
