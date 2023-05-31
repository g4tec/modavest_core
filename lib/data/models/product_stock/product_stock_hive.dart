import 'package:hive/hive.dart';

part 'product_stock_hive.g.dart';

@HiveType(typeId: 49)
class HiveProductStock extends HiveObject {
  @HiveField(0)
  final num integrationId;
  @HiveField(1)
  final num officialStoreId;
  @HiveField(2)
  final num productCode;
  @HiveField(3)
  final num? stock;

  HiveProductStock({
    required this.integrationId,
    required this.officialStoreId,
    required this.productCode,
    required this.stock,
  });
}
