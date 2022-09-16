import 'package:hive/hive.dart';

part 'details_hive.g.dart';

@HiveType(typeId: 5)
class HiveDetail extends HiveObject {
  @HiveField(0)
  final int integrationId;
  @HiveField(1)
  final int? typeCode;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final String? auxiliaryType;
  @HiveField(4)
  final String? title;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final String referenceCode;
  HiveDetail({
    required this.integrationId,
    required this.referenceCode,
    this.typeCode,
    this.type,
    this.auxiliaryType,
    this.title,
    this.description,
  });
}
