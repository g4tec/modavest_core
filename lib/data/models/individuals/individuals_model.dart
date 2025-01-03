import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:modavest_core/data/models/address/address_model.dart';
import 'package:modavest_core/data/models/enterprise_reference.dart/enterprise_reference.dart';
import 'package:modavest_core/data/models/individuals/individuals_hive.dart';
import 'package:modavest_core/data/models/legal_person_email/legal_person_email.dart';
import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone.dart';
import 'package:modavest_core/domain/models/individual.dart';
import 'package:modavest_core/utils/format_date.dart';

class IndividualModel extends Individual {
  IndividualModel({
    int? code,
    String? cpf,
    required String name,
    String? surname,
    String? gender,
    String? birthDate,
    String? maritalStatus,
    String? nationality,
    String? occupation,
    num monthlyIncome = 0,
    required List<AddressModel> addresses,
    List<LegalPersonPhoneModel>? phones,
    List<LegalPersonEmailModel>? emails,
    List<EnterpriseReferenceModel>? references,
    bool isInactive = false,
    int branchInsertCode = 1,
    num integrationId = 0,
    String? uf,
    String? status,
    String? maxChangeFilterDate,
    required String insertDate,
    bool isSynchronized = true,
  }) : super(
          code: code,
          cpf: cpf,
          name: name,
          surname: surname,
          gender: gender,
          birthDate: birthDate,
          maritalStatus: maritalStatus,
          nationality: nationality,
          occupation: occupation,
          monthlyIncome: monthlyIncome,
          addresses: addresses,
          emails: emails ?? [],
          phones: phones ?? [],
          references: references ?? [],
          isInactive: isInactive,
          branchInsertCode: branchInsertCode,
          integrationId: integrationId,
          uf: uf,
          status: status,
          maxChangeFilterDate: maxChangeFilterDate,
          insertDate: insertDate,
          isSynchronized: isSynchronized,
        );

  factory IndividualModel.fromJson(Map<String, dynamic> json) {
    return IndividualModel(
      code: json["code"] as int?,
      cpf: json["cpf"] as String?,
      name: json["name"] as String,
      surname: json["surname"] as String?,
      gender: json["gender"] as String?,
      birthDate: formatDate(DateTime.tryParse(json["birthDate"])),
      maritalStatus: json["maritalStatus"] as String?,
      nationality: json["nationality"] as String?,
      occupation: json["occupation"] as String?,
      monthlyIncome: json["monthlyIncome"] is String
          ? num.parse(json["monthlyIncome"] as String)
          : json["monthlyIncome"] as num? ?? 0,
      addresses: (json["addresses"] as List? ?? [])
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      emails: (json["emails"] as List? ?? [])
          .map((e) => LegalPersonEmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phones: (json["phones"] as List? ?? [])
          .map((e) => LegalPersonPhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      references: (json["references"] as List? ?? [])
          .mapIndexed((index, e) => EnterpriseReferenceModel.fromJson(
              e as Map<String, dynamic>, index))
          .toList(),
      isInactive: json["isInactive"] as bool? ?? false,
      branchInsertCode: json["branchInsertCode"] as int? ?? 1,
      integrationId: json["integrationId"] as num? ?? 0,
      uf: json["uf"] as String?,
      status: json["status"] as String?,
      maxChangeFilterDate: json["maxChangeFilterDate"] as String?,
      insertDate: json["insertDate"] as String,
      isSynchronized: json["isSynchronized"] as bool? ?? true,
    );
  }

  factory IndividualModel.entite(Individual individualEntity) {
    return IndividualModel(
      code: individualEntity.code,
      cpf: individualEntity.cpf,
      name: individualEntity.name ?? '',
      surname: individualEntity.surname,
      gender: individualEntity.gender,
      birthDate: individualEntity.birthDate,
      maritalStatus: individualEntity.maritalStatus,
      nationality: individualEntity.nationality,
      occupation: individualEntity.occupation,
      monthlyIncome: individualEntity.monthlyIncome,
      addresses: (individualEntity.addresses)
          .map((e) => AddressModel.entitie(e))
          .toList(),
      emails: (individualEntity.emails)
          .map((e) => LegalPersonEmailModel.entitie(e))
          .toList(),
      phones: (individualEntity.phones)
          .map((e) => LegalPersonPhoneModel.entitie(e))
          .toList(),
      references: (individualEntity.references)
          .map((e) => EnterpriseReferenceModel.entitie(e))
          .toList(),
      isInactive: individualEntity.isInactive,
      branchInsertCode: individualEntity.branchInsertCode,
      integrationId: individualEntity.integrationId,
      uf: individualEntity.uf,
      status: individualEntity.status,
      maxChangeFilterDate: individualEntity.maxChangeFilterDate,
      insertDate: individualEntity.insertDate ?? '',
      isSynchronized: individualEntity.isSynchronized,
    );
  }

  factory IndividualModel.fromHive(HiveIndividual individualHive) {
    return IndividualModel(
      code: individualHive.code,
      cpf: individualHive.cpf,
      name: individualHive.name ?? '',
      surname: individualHive.surname,
      gender: individualHive.gender,
      birthDate: individualHive.birthDate,
      maritalStatus: individualHive.maritalStatus,
      nationality: individualHive.nationality,
      occupation: individualHive.occupation,
      monthlyIncome: individualHive.monthlyIncome,
      addresses: (individualHive.addresses)
              ?.map((e) => AddressModel.fromHive(e))
              .toList() ??
          [],
      emails: (individualHive.emails)
              ?.map((e) => LegalPersonEmailModel.fromHive(e))
              .toList() ??
          [],
      phones: (individualHive.phones)
              ?.map((e) => LegalPersonPhoneModel.fromHive(e))
              .toList() ??
          [],
      references: (individualHive.references)
              ?.map((e) => EnterpriseReferenceModel.fromHive(e))
              .toList() ??
          [],
      isInactive: individualHive.isInactive,
      branchInsertCode: individualHive.branchInsertCode,
      integrationId: individualHive.integrationId,
      uf: individualHive.uf,
      status: individualHive.status,
      maxChangeFilterDate: individualHive.maxChangeFilterDate,
      insertDate: individualHive.insertDate ?? '',
      isSynchronized: individualHive.isSynchronized,
    );
  }

  HiveIndividual toHive() {
    return HiveIndividual(
      code: code,
      cpf: cpf,
      name: name ?? '',
      surname: surname,
      gender: gender,
      birthDate: birthDate,
      maritalStatus: maritalStatus,
      nationality: nationality,
      occupation: occupation,
      monthlyIncome: monthlyIncome,
      isInactive: isInactive,
      branchInsertCode: branchInsertCode,
      integrationId: integrationId,
      uf: uf,
      status: status,
      maxChangeFilterDate: maxChangeFilterDate,
      insertDate: insertDate ?? '',
      isSynchronized: isSynchronized,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "cpf": cpf,
      "name": name,
      "surname": surname,
      "gender": gender,
      "birthDate": birthDate != null && convertDate(birthDate!) != null
          ? DateFormat('yyyy-MM-dd').format(convertDate(birthDate!)!)
          : null,
      "maritalStatus": maritalStatus,
      "nationality": nationality,
      "occupation": occupation,
      "monthlyIncome": monthlyIncome,
      "addresses": addresses.map((e) => (e as AddressModel).toJson()).toList(),
      "emails":
          emails.map((e) => (e as LegalPersonEmailModel).toJson()).toList(),
      "phones":
          phones.map((e) => (e as LegalPersonPhoneModel).toJson()).toList(),
      "references": references
          .map((e) => (e as EnterpriseReferenceModel).toJson())
          .toList(),
      "isInactive": isInactive,
      "branchInsertCode": branchInsertCode,
      "integrationId": integrationId,
      "uf": uf,
      "status": status,
      "maxChangeFilterDate": maxChangeFilterDate,
      "insertDate": insertDate,
      "isSynchronized": isSynchronized,
    };
  }
}
