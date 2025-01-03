// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individuals_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveIndividualAdapter extends TypeAdapter<HiveIndividual> {
  @override
  final int typeId = 53;

  @override
  HiveIndividual read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveIndividual(
      code: fields[0] as int?,
      cpf: fields[1] as String?,
      isInactive: fields[2] as bool,
      branchInsertCode: fields[3] as int,
      name: fields[4] as String?,
      surname: fields[5] as String?,
      uf: fields[6] as String?,
      gender: fields[7] as String?,
      birthDate: fields[8] as String?,
      maritalStatus: fields[9] as String?,
      nationality: fields[10] as String?,
      occupation: fields[11] as String?,
      monthlyIncome: fields[12] as num,
      status: fields[13] as String?,
      maxChangeFilterDate: fields[14] as String?,
      insertDate: fields[15] as String?,
      addresses: (fields[16] as HiveList?)?.castHiveList(),
      isSynchronized: fields[17] as bool,
      integrationId: fields[18] as num,
      phones: (fields[20] as HiveList?)?.castHiveList(),
      emails: (fields[19] as HiveList?)?.castHiveList(),
      references: (fields[21] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveIndividual obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.cpf)
      ..writeByte(2)
      ..write(obj.isInactive)
      ..writeByte(3)
      ..write(obj.branchInsertCode)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.surname)
      ..writeByte(6)
      ..write(obj.uf)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.birthDate)
      ..writeByte(9)
      ..write(obj.maritalStatus)
      ..writeByte(10)
      ..write(obj.nationality)
      ..writeByte(11)
      ..write(obj.occupation)
      ..writeByte(12)
      ..write(obj.monthlyIncome)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.maxChangeFilterDate)
      ..writeByte(15)
      ..write(obj.insertDate)
      ..writeByte(16)
      ..write(obj.addresses)
      ..writeByte(17)
      ..write(obj.isSynchronized)
      ..writeByte(18)
      ..write(obj.integrationId)
      ..writeByte(19)
      ..write(obj.emails)
      ..writeByte(20)
      ..write(obj.phones)
      ..writeByte(21)
      ..write(obj.references);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveIndividualAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
