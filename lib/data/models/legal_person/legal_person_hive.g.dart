// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_person_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLegalPersonAdapter extends TypeAdapter<HiveLegalPerson> {
  @override
  final int typeId = 21;

  @override
  HiveLegalPerson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLegalPerson(
      code: fields[0] as int?,
      cnpj: fields[1] as String?,
      isInactive: fields[2] as bool,
      branchInsertCode: fields[3] as int,
      name: fields[4] as String?,
      fantasyName: fields[5] as String?,
      uf: fields[6] as String?,
      numberStateRegistration: fields[7] as String,
      dateFoundation: fields[8] as String?,
      codeActivity: fields[9] as String?,
      numberAgents: fields[10] as num,
      monthlyInvoicing: fields[11] as String,
      shareCapital: fields[12] as String,
      homePage: fields[13] as String?,
      codeActivityCnae: fields[14] as String,
      codeActivityCnae2: fields[15] as String,
      typeTaxRegime: fields[16] as String,
      typeSubTributary: fields[17] as String,
      typeDescriptionSuFrama: fields[18] as String,
      registrationMunicipal: fields[19] as String?,
      descriptionJuntaCial: fields[20] as String?,
      dateRegJuntaCial: fields[21] as String?,
      codeMainRelated: fields[22] as String?,
      cpfCnpjMainRelated: fields[23] as String?,
      nameMainRelated: fields[24] as String?,
      maxChangeFilterDate: fields[25] as String?,
      status: fields[26] as String?,
      insertDate: fields[27] as String?,
      addresses: (fields[28] as HiveList?)?.castHiveList(),
      phones: (fields[29] as List?)?.cast<HiveLegalPersonPhone>(),
      emails: (fields[30] as List?)?.cast<HiveLegalPersonEmail>(),
      contacts: (fields[32] as List?)?.cast<HiveLegalPersonContact>(),
      isSynchronized: fields[31] as bool,
      socialNetworks:
          (fields[35] as List?)?.cast<HiveEnterpriseSocialNetwork>(),
    )
      ..integrationId = fields[33] as num?
      ..references = (fields[34] as List?)?.cast<HiveEnterpriseReference>();
  }

  @override
  void write(BinaryWriter writer, HiveLegalPerson obj) {
    writer
      ..writeByte(36)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.cnpj)
      ..writeByte(2)
      ..write(obj.isInactive)
      ..writeByte(3)
      ..write(obj.branchInsertCode)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.fantasyName)
      ..writeByte(6)
      ..write(obj.uf)
      ..writeByte(7)
      ..write(obj.numberStateRegistration)
      ..writeByte(8)
      ..write(obj.dateFoundation)
      ..writeByte(9)
      ..write(obj.codeActivity)
      ..writeByte(10)
      ..write(obj.numberAgents)
      ..writeByte(11)
      ..write(obj.monthlyInvoicing)
      ..writeByte(12)
      ..write(obj.shareCapital)
      ..writeByte(13)
      ..write(obj.homePage)
      ..writeByte(14)
      ..write(obj.codeActivityCnae)
      ..writeByte(15)
      ..write(obj.codeActivityCnae2)
      ..writeByte(16)
      ..write(obj.typeTaxRegime)
      ..writeByte(17)
      ..write(obj.typeSubTributary)
      ..writeByte(18)
      ..write(obj.typeDescriptionSuFrama)
      ..writeByte(19)
      ..write(obj.registrationMunicipal)
      ..writeByte(20)
      ..write(obj.descriptionJuntaCial)
      ..writeByte(21)
      ..write(obj.dateRegJuntaCial)
      ..writeByte(22)
      ..write(obj.codeMainRelated)
      ..writeByte(23)
      ..write(obj.cpfCnpjMainRelated)
      ..writeByte(24)
      ..write(obj.nameMainRelated)
      ..writeByte(25)
      ..write(obj.maxChangeFilterDate)
      ..writeByte(26)
      ..write(obj.status)
      ..writeByte(27)
      ..write(obj.insertDate)
      ..writeByte(28)
      ..write(obj.addresses)
      ..writeByte(29)
      ..write(obj.phones)
      ..writeByte(30)
      ..write(obj.emails)
      ..writeByte(31)
      ..write(obj.isSynchronized)
      ..writeByte(32)
      ..write(obj.contacts)
      ..writeByte(33)
      ..write(obj.integrationId)
      ..writeByte(34)
      ..write(obj.references)
      ..writeByte(35)
      ..write(obj.socialNetworks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLegalPersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
