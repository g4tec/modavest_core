import 'package:hive_flutter/hive_flutter.dart';

part 'options_hive.g.dart';

@HiveType(typeId: 31)
class HiveOptions extends HiveObject {
  @HiveField(0)
  final String? observation;
  @HiveField(1)
  final num officialStoreId;
  @HiveField(2)
  final num questionId;
  @HiveField(3)
  final num sequence;
  @HiveField(4)
  final String option;
  @HiveField(5)
  final String? definedField;
  @HiveField(6)
  final String? definedFieldValue;
  @HiveField(7)
  final String? definedFieldType;
  @HiveField(8)
  final num? typeCode;
  @HiveField(9)
  final String? code;
  HiveOptions({
    required this.observation,
    required this.officialStoreId,
    required this.questionId,
    required this.sequence,
    required this.option,
    required this.definedField,
    required this.definedFieldValue,
    required this.definedFieldType,
    required this.typeCode,
    required this.code,
  });
}
