import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/reference/reference_hive.dart';

part 'item_sales_order_hive.g.dart';

@HiveType(typeId: 12)
class HiveItemSalesOrder extends HiveObject {
  @HiveField(0)
  final int? integrationId;
  @HiveField(1)
  final String? orderId;
  @HiveField(2)
  final num? sequenceItem;
  @HiveField(3)
  final num productCode;
  @HiveField(4)
  final String? productSku;
  @HiveField(5)
  final String? productName;
  @HiveField(6)
  final String? referenceCode;
  @HiveField(7)
  final String? referenceName;
  @HiveField(8)
  final String? colorCode;
  @HiveField(9)
  final String? colorName;
  @HiveField(10)
  final String? sizeName;
  @HiveField(11)
  num? quantity;
  @HiveField(18)
  num? originalPrice;
  @HiveField(19)
  num price;
  @HiveField(20)
  final num? discountPercentage;
  @HiveField(21)
  final DateTime? billingForecastDate;
  @HiveField(22)
  HiveReference? reference;
  @HiveField(23)
  bool? referenceIsPack;
  @HiveField(24)
  num? scaleCode;

  HiveItemSalesOrder({
    required this.integrationId,
    required this.orderId,
    required this.sequenceItem,
    required this.productCode,
    required this.productSku,
    this.productName,
    required this.referenceCode,
    required this.referenceName,
    required this.colorCode,
    this.colorName,
    this.sizeName,
    required this.quantity,
    this.originalPrice,
    required this.price,
    this.discountPercentage,
    this.billingForecastDate,
    this.reference,
    required this.referenceIsPack,
    required this.scaleCode,
  });
}
