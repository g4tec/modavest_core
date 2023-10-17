import 'package:intl/intl.dart';
import 'package:modavest_core/data/models/legal_person_contact/legal_person_contact_hive.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';

class LegalPersonContactModel extends LegalPersonContact {
  LegalPersonContactModel({
    num? legalPersonCode,
    num? integrationId,
    int? sequence,
    required String name,
    num? typeCode,
    String? typeName,
    String? function,
    String? phoneNumber,
    String? cellNumber,
    String? email,
    DateTime? birthDate,
  }) : super(
          legalPersonCode: legalPersonCode,
          integrationId: integrationId,
          sequence: sequence,
          name: name,
          typeCode: typeCode,
          typeName: typeName,
          function: function,
          phoneNumber: phoneNumber,
          cellNumber: cellNumber,
          email: email,
          birthDate: birthDate,
        );
  factory LegalPersonContactModel.fromJson(Map<String, dynamic> json) {
    return LegalPersonContactModel(
      legalPersonCode: json["legalPersonCode"] as num?,
      integrationId: json["integrationId"] as num?,
      sequence: json["sequence"] as int,
      name: json["name"] as String,
      typeCode: json["typeCode"] as num?,
      typeName: json["typeName"] as String?,
      function: json["function"] as String?,
      phoneNumber: json["phoneNumber"] as String?,
      cellNumber: json["cellNumber"] as String?,
      email: json["email"] as String?,
      birthDate: json["birthDate"] != null
          ? DateTime.parse(json["birthDate"] as String)
          : null,
    );
  }

  factory LegalPersonContactModel.fromHive(
    HiveLegalPersonContact hiveLegalPersonContact,
  ) {
    return LegalPersonContactModel(
      legalPersonCode: hiveLegalPersonContact.legalPersonCode,
      integrationId: hiveLegalPersonContact.integrationId,
      sequence: hiveLegalPersonContact.sequence,
      name: hiveLegalPersonContact.name,
      typeCode: hiveLegalPersonContact.typeCode,
      typeName: hiveLegalPersonContact.typeName,
      function: hiveLegalPersonContact.function,
      phoneNumber: hiveLegalPersonContact.phoneNumber,
      cellNumber: hiveLegalPersonContact.cellNumber,
      email: hiveLegalPersonContact.email,
      birthDate: hiveLegalPersonContact.birthDate,
    );
  }

  HiveLegalPersonContact toHive() {
    return HiveLegalPersonContact(
      legalPersonCode: legalPersonCode,
      integrationId: integrationId,
      sequence: sequence ?? 0,
      name: name,
      typeCode: typeCode,
      typeName: typeName,
      function: function,
      phoneNumber: phoneNumber,
      cellNumber: cellNumber,
      email: email,
      birthDate: birthDate,
    );
  }

  Map<String, dynamic> toJson({
    num? integrationIdParam,
    num? legalPersonCodeParam,
    bool noSequence = false,
  }) {
    String? formattedBirthDate;
    if (birthDate != null) {
      var dateFormatter = DateFormat('yyyy-MM-dd');
      formattedBirthDate = dateFormatter.format(birthDate!);
    }
    final Map<String, dynamic> data = {
      "legalPersonCode": legalPersonCodeParam ?? legalPersonCode,
      "integrationId": integrationIdParam ?? integrationId,
      "sequence": noSequence ? null : sequence,
      "name": name,
      "typeCode": typeCode,
      "typeName": typeName,
      "function": function,
      "phoneNumber": phoneNumber,
      "cellNumber": cellNumber,
      "email": email,
      "birthDate": formattedBirthDate,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory LegalPersonContactModel.entitie(LegalPersonContact e,
      {int? sequence}) {
    return LegalPersonContactModel(
      legalPersonCode: e.legalPersonCode,
      integrationId: e.integrationId,
      sequence: sequence ?? e.sequence,
      name: e.name,
      typeCode: e.typeCode,
      typeName: e.typeName,
      function: e.function,
      phoneNumber: e.phoneNumber,
      cellNumber: e.cellNumber,
      email: e.email,
      birthDate: e.birthDate,
    );
  }
}
