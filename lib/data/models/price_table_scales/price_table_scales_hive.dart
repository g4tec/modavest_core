import 'package:hive_flutter/hive_flutter.dart';
import 'package:modavest_core/data/models/scale/scale_hive.dart';

part 'price_table_scales_hive.g.dart';

@HiveType(typeId: 42)
class HivePriceTableScales extends HiveObject {
  @HiveField(0)
  final num scaleCode;
  @HiveField(1)
  final num integrationId;
  @HiveField(2)
  final num headerCode;
  @HiveField(3)
  final String? scaleDescription;
  @HiveField(4)
  HiveList<HiveScale>? scales;
  @HiveField(5)
  final num priceTableCode;
  @HiveField(6)
  final String param;
  HivePriceTableScales({
    required this.scaleCode,
    required this.integrationId,
    required this.headerCode,
    required this.scaleDescription,
    required this.scales,
    required this.priceTableCode,
    required this.param,
  });
}
