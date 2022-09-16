import 'package:hive/hive.dart';

part 'reference_code_sequence_hive.g.dart';

@HiveType(typeId: 9)
class HiveReferenceCodeSequence extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? code;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final int? referenceId;
  @HiveField(4)
  final int? parentCode;

  HiveReferenceCodeSequence({
    required this.id,
    this.code,
    this.name,
    this.referenceId,
    this.parentCode,
  });
}
