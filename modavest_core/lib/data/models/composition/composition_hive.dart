import 'package:hive/hive.dart';

part 'composition_hive.g.dart';

@HiveType(typeId: 4)
class HiveComposition extends HiveObject {
  @HiveField(0)
  final String referenceCode;
  @HiveField(1)
  final int integrationId;
  @HiveField(2)
  final String material;
  @HiveField(3)
  final double? percentage;

  HiveComposition({
    required this.referenceCode,
    required this.integrationId,
    required this.material,
    this.percentage,
  });
}
