import 'package:hive/hive.dart';

part 'product_price_hive.g.dart';

@HiveType(typeId: 27)
class HiveProductPrice extends HiveObject {
  @HiveField(0)
  final num? productCode;
  @HiveField(1)
  final num? originalPrice;
  @HiveField(2)
  final num? branchCode;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String referenceCode;
  @HiveField(5)
  final num? scaleCode;
  HiveProductPrice({
    required this.productCode,
    required this.originalPrice,
    required this.branchCode,
    required this.price,
    required this.referenceCode,
    required this.scaleCode,
  });
}
