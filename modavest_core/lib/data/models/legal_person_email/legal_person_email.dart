import 'package:modavest_core/data/models/legal_person_email/legal_person_email_hive.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';

class LegalPersonEmailModel extends LegalPersonEmail {
  LegalPersonEmailModel({
    String? email,
    int typeCode = 1,
    bool isDefault = false,
    num? sequence,
  }) : super(
          email: email,
          typeCode: typeCode,
          isDefault: isDefault,
          sequence: sequence,
        );
  factory LegalPersonEmailModel.fromJson(Map<String, dynamic> json) {
    return LegalPersonEmailModel(
      email: json["email"] as String?,
      typeCode: json["typeCode"] as int? ?? 1,
      isDefault: json["isDefault"] as bool? ?? false,
    );
  }

  factory LegalPersonEmailModel.fromHive(
    HiveLegalPersonEmail hiveLegalPersonEmail,
  ) {
    return LegalPersonEmailModel(
      email: hiveLegalPersonEmail.email,
      typeCode: hiveLegalPersonEmail.typeCode,
      isDefault: hiveLegalPersonEmail.isDefault,
    );
  }

  HiveLegalPersonEmail toHive() {
    return HiveLegalPersonEmail(
      email: email,
      typeCode: typeCode,
      isDefault: isDefault,
    );
  }

  Map<String, dynamic> toJson({bool noSequence = false}) {
    final Map<String, dynamic> data = {
      "email": email,
      "typeCode": typeCode,
      "isDefault": isDefault,
      "sequence": noSequence ? null : sequence,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory LegalPersonEmailModel.entitie(LegalPersonEmail e) {
    return LegalPersonEmailModel(
      email: e.email,
      typeCode: e.typeCode,
      isDefault: e.isDefault,
      sequence: e.sequence,
    );
  }
}
