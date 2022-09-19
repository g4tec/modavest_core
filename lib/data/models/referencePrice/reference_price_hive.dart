import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/productPrice/product_price_hive.dart';

part 'reference_price_hive.g.dart';

@HiveType(typeId: 33)
class HiveReferencePrice extends HiveObject {
  @HiveField(0)
  final String? referenceCode;
  @HiveField(1)
  final num? min;
  @HiveField(2)
  HiveList<HiveProductPrice>? prices;
  @HiveField(3)
  final num priceTableCode;

  HiveReferencePrice({
    required this.referenceCode,
    required this.min,
    required this.prices,
    required this.priceTableCode,
  });
}
