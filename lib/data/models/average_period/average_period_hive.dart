import 'package:hive/hive.dart';

part 'average_period_hive.g.dart';

@HiveType(typeId: 45)
class HiveAveragePeriod extends HiveObject {
  @HiveField(0)
  final num priceTableCode;
  @HiveField(1)
  final num integrationId;
  @HiveField(2)
  final num sequence;
  @HiveField(3)
  final num? quantity;
  @HiveField(4)
  final num? state;
  @HiveField(5)
  final num? variationPercentage;
  @HiveField(6)
  final num? variationValue;

  HiveAveragePeriod({
    required this.priceTableCode,
    required this.integrationId,
    required this.sequence,
    required this.quantity,
    required this.state,
    required this.variationPercentage,
    required this.variationValue,
  });
}
