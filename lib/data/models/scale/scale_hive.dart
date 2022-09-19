import 'package:hive/hive.dart';

part 'scale_hive.g.dart';

@HiveType(typeId: 40)
class HiveScale extends HiveObject {
  @HiveField(0)
  final num scaleCode;
  @HiveField(1)
  final num integrationId;
  @HiveField(2)
  final num code;
  @HiveField(3)
  final num? sequence;
  @HiveField(4)
  final num? quantity;
  @HiveField(5)
  final num? variationValue;
  @HiveField(6)
  final num? variationPercentage;

  HiveScale({
    required this.scaleCode,
    required this.integrationId,
    required this.code,
    required this.sequence,
    required this.quantity,
    required this.variationValue,
    required this.variationPercentage,
  });
}
