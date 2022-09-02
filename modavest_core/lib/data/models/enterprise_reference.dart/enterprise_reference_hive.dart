import 'package:hive_flutter/hive_flutter.dart';

part 'enterprise_reference_hive.g.dart';

@HiveType(typeId: 47)
class HiveEnterpriseReference extends HiveObject {
  @HiveField(0)
  final int? sequence;
  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? typeReference;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final num? integrationId;

  HiveEnterpriseReference({
    this.phoneNumber,
    this.name,
    this.description,
    this.typeReference,
    required this.sequence,
    required this.integrationId,
  });
}
