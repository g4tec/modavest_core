import 'package:hive_flutter/hive_flutter.dart';

part 'enterprise_social_network_hive.g.dart';

@HiveType(typeId: 48)
class HiveEnterpriseSocialNetwork extends HiveObject {
  @HiveField(0)
  final int sequence;
  @HiveField(1)
  final num? integrationId;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final num? typeCode;
  @HiveField(4)
  final String? typeName;

  HiveEnterpriseSocialNetwork({
    this.address,
    this.integrationId,
    this.typeName,
    this.typeCode,
    required this.sequence,
  });
}
