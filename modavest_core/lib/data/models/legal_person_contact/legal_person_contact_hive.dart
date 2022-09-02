import 'package:hive_flutter/hive_flutter.dart';

part 'legal_person_contact_hive.g.dart';

@HiveType(typeId: 46)
class HiveLegalPersonContact extends HiveObject {
  @HiveField(0)
  final num? legalPersonCode;
  @HiveField(1)
  final num? integrationId;
  @HiveField(2)
  final int sequence;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final num? typeCode;
  @HiveField(5)
  final String? typeName;
  @HiveField(6)
  final String? function;
  @HiveField(7)
  final String? phoneNumber;
  @HiveField(8)
  final String? cellNumber;
  @HiveField(9)
  final String? email;
  @HiveField(10)
  final DateTime? bithDate;

  HiveLegalPersonContact({
    this.legalPersonCode,
    this.integrationId,
    required this.sequence,
    required this.name,
    this.typeCode,
    this.typeName,
    this.function,
    this.phoneNumber,
    this.cellNumber,
    this.email,
    this.bithDate,
  });
}
