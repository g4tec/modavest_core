import 'package:hive_flutter/hive_flutter.dart';

part 'legal_person_related_hive.g.dart';

@HiveType(typeId: 54)
class HiveLegalPersonRelated extends HiveObject {
  @HiveField(0)
  int? code;
  @HiveField(1)
  String? cpfCnpj;
  @HiveField(2)
  int? legalPersonCode;
  @HiveField(3)
  int? integrationId;
  @HiveField(4)
  String? name;

  HiveLegalPersonRelated({
    this.integrationId,
    this.code,
    this.cpfCnpj,
    this.legalPersonCode,
    this.name,
  });
}
