import 'package:hive_flutter/hive_flutter.dart';

part 'legal_person_email_hive.g.dart';

@HiveType(typeId: 22)
class HiveLegalPersonEmail extends HiveObject {
  @HiveField(0)
  final String? email;
  @HiveField(1)
  final int typeCode;
  @HiveField(2)
  final bool isDefault;

  HiveLegalPersonEmail({
    this.email,
    this.typeCode = 1,
    this.isDefault = false,
  });
}
