import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone_hive.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';

class LegalPersonPhoneModel extends LegalPersonPhone {
  LegalPersonPhoneModel({
    String? number,
    int typeCode = 1,
    int? branchLine,
    bool isDefault = false,
    num? sequence,
  }) : super(
          number: number,
          typeCode: typeCode,
          branchLine: branchLine,
          isDefault: isDefault,
          sequence: sequence,
        );
  factory LegalPersonPhoneModel.fromJson(Map<String, dynamic> json) {
    return LegalPersonPhoneModel(
      number: json["number"] as String?,
      typeCode: json["typeCode"] as int? ?? 1,
      branchLine: json["branchLine"] as int?,
      isDefault: json["isDefault"] as bool? ?? false,
      sequence: json["sequence"] as num?,
    );
  }

  factory LegalPersonPhoneModel.fromHive(
    HiveLegalPersonPhone hiveLegalPersonPhone,
  ) {
    return LegalPersonPhoneModel(
      number: hiveLegalPersonPhone.number,
      typeCode: hiveLegalPersonPhone.typeCode,
      branchLine: hiveLegalPersonPhone.branchLine,
      isDefault: hiveLegalPersonPhone.isDefault,
    );
  }

  HiveLegalPersonPhone toHive() {
    return HiveLegalPersonPhone(
      number: number,
      typeCode: typeCode,
      branchLine: branchLine,
      isDefault: isDefault,
    );
  }

  factory LegalPersonPhoneModel.entitie(LegalPersonPhone e, {num? sequence}) {
    return LegalPersonPhoneModel(
      number: e.number,
      typeCode: e.typeCode,
      branchLine: e.branchLine,
      isDefault: e.isDefault,
      sequence: sequence ?? e.sequence,
    );
  }
  Map<String, dynamic> toJson({bool noSequence = false}) {
    final Map<String, dynamic> data = {
      "number": number,
      "typeCode": typeCode,
      "branchLine": branchLine,
      "isDefault": isDefault,
      "sequence": noSequence ? null : sequence,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
