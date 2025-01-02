import 'package:modavest_core/data/models/enterprise_reference.dart/enterprise_reference_hive.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';

class EnterpriseReferenceModel extends EnterpriseReference {
  EnterpriseReferenceModel({
    int? sequence,
    num? integrationId,
    String? phoneNumber,
    String? name,
    String? typeReference,
    String? description,
  }) : super(
          integrationId: integrationId,
          phoneNumber: phoneNumber,
          name: name,
          description: description,
          typeReference: typeReference,
          sequence: sequence,
        );
  factory EnterpriseReferenceModel.fromJson(
    Map<String, dynamic> json,
    int sequence,
  ) {
    return EnterpriseReferenceModel(
      phoneNumber: json["phoneNumber"] as String?,
      integrationId: json["integrationId"] as num?,
      name: json["responsiblePersonName"] as String?,
      description: json["description"] as String?,
      typeReference: json["type"] as String?,
      sequence: json["sequence"] as int? ?? sequence,
    );
  }

  factory EnterpriseReferenceModel.fromHive(
    HiveEnterpriseReference hiveEnterpriseReference,
  ) {
    return EnterpriseReferenceModel(
      integrationId: hiveEnterpriseReference.integrationId,
      sequence: hiveEnterpriseReference.sequence,
      name: hiveEnterpriseReference.name,
      phoneNumber: hiveEnterpriseReference.phoneNumber,
      description: hiveEnterpriseReference.description,
      typeReference: hiveEnterpriseReference.typeReference,
    );
  }

  HiveEnterpriseReference toHive() {
    return HiveEnterpriseReference(
      integrationId: integrationId,
      sequence: sequence,
      name: name,
      phoneNumber: phoneNumber,
      description: description,
      typeReference: typeReference,
    );
  }

  Map<String, dynamic> toJson({
    num? integrationIdParam,
    num? legalPersonCodeParam,
    bool noSequence = false,
  }) {
    final Map<String, dynamic> data = {
      "legalPersonCode": legalPersonCodeParam,
      "integrationId": integrationIdParam ?? integrationId,
      "sequence": noSequence ? null : sequence,
      "responsiblePersonName": name,
      "phoneNumber": phoneNumber,
      "description": description,
      "type": typeReference,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory EnterpriseReferenceModel.entitie(EnterpriseReference e,
      {int? sequence}) {
    return EnterpriseReferenceModel(
      integrationId: sequence ?? e.integrationId,
      sequence: e.sequence,
      name: e.name,
      phoneNumber: e.phoneNumber,
      description: e.description,
      typeReference: e.typeReference,
    );
  }
}
