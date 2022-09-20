import 'package:modavest_core/domain/models/reference.dart';

class ItemSalesOrder {
  final int? integrationId;
  final String? orderId;
  final num? sequenceItem;
  final num productCode;
  final String? productSku;
  final String? productName;
  final String? referenceCode;
  final String? referenceName;
  final String? colorCode;
  final String? colorName;
  final String? sizeName;
  num? quantity;
  num? originalPrice;
  num price;
  final num? discountPercentage;
  final DateTime? billingForecastDate;
  Reference? reference;
  bool? referenceIsPack;
  num? scaleCode;

  ItemSalesOrder({
    required this.integrationId,
    required this.orderId,
    required this.sequenceItem,
    required this.productCode,
    required this.productSku,
    this.productName,
    required this.referenceCode,
    required this.referenceIsPack,
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
    this.scaleCode,
  });

  factory ItemSalesOrder.copy(ItemSalesOrder item) {
    return ItemSalesOrder(
      integrationId: item.integrationId,
      orderId: item.orderId,
      sequenceItem: item.sequenceItem,
      productCode: item.productCode,
      productSku: item.productSku,
      productName: item.productName,
      referenceCode: item.referenceCode,
      referenceIsPack: item.referenceIsPack,
      referenceName: item.referenceName,
      colorCode: item.colorCode,
      colorName: item.colorName,
      sizeName: item.sizeName,
      quantity: item.quantity,
      originalPrice: item.originalPrice,
      price: item.price,
      discountPercentage: item.discountPercentage,
      billingForecastDate: item.billingForecastDate,
      reference: item.reference,
      scaleCode: item.scaleCode,
    );
  }
}
