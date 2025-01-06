import 'package:modavest_core/data/models/legal_person_related/legal_person_related_hive.dart';

import 'package:modavest_core/domain/models/legal_person_related.dart';

class LegalPersonRelatedModel extends LegalPersonRelated {
  LegalPersonRelatedModel({
    super.integrationId = 0,
    required super.code,
    required super.legalPersonCode,
    required super.cpfCnpj,
    required super.name,
  });
  factory LegalPersonRelatedModel.fromJson(Map json) {
    return LegalPersonRelatedModel(
      code: json["code"] as int?,
      legalPersonCode: json["legalPersonCode"] as int?,
      integrationId: json["integrationId"] as int? ?? 0,
      cpfCnpj: json["cpfCnpj"] as String?,
      name: json["name"] as String?,
    );
  }

  factory LegalPersonRelatedModel.entitie(
      LegalPersonRelated legalPersonRelated) {
    return LegalPersonRelatedModel(
      integrationId: legalPersonRelated.integrationId,
      code: legalPersonRelated.code,
      cpfCnpj: legalPersonRelated.cpfCnpj,
      name: legalPersonRelated.name,
      legalPersonCode: legalPersonRelated.legalPersonCode,
    );
  }

  HiveLegalPersonRelated toHive() {
    return HiveLegalPersonRelated(
      code: code,
      cpfCnpj: cpfCnpj,
      legalPersonCode: legalPersonCode,
      name: name,
      integrationId: integrationId,
    );
  }

  factory LegalPersonRelatedModel.fromHive(
      HiveLegalPersonRelated hiveLegalPerson) {
    return LegalPersonRelatedModel(
      code: hiveLegalPerson.code,
      cpfCnpj: hiveLegalPerson.cpfCnpj,
      legalPersonCode: hiveLegalPerson.legalPersonCode,
      name: hiveLegalPerson.name,
      integrationId: hiveLegalPerson.integrationId,
    );
  }
}
