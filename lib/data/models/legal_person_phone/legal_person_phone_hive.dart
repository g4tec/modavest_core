import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'legal_person_phone_hive.g.dart';

@HiveType(typeId: 26)
class HiveLegalPersonPhone extends HiveObject {
  @HiveField(0)
  final int typeCode;
  @HiveField(1)
  final String? number;
  @HiveField(2)
  final int? branchLine;
  @HiveField(3)
  final bool isDefault;

  HiveLegalPersonPhone({
    this.typeCode = 1,
    this.number,
    this.branchLine,
    this.isDefault = false,
  });
}
