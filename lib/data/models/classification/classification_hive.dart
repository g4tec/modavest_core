import 'package:hive/hive.dart';
part 'classification_hive.g.dart';

@HiveType(typeId: 2)
class HiveClassification extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? typeCode;
  @HiveField(2)
  final String? typeName;
  @HiveField(3)
  final String? typeNameAux;
  @HiveField(4)
  final String? code;
  @HiveField(5)
  final String? name;
  @HiveField(6)
  final String? nameAux;
  @HiveField(7)
  final String? subcategoryId;

  HiveClassification({
    required this.id,
    this.typeCode,
    this.typeName,
    this.typeNameAux,
    this.code,
    this.name,
    this.nameAux,
    this.subcategoryId,
  });
}
