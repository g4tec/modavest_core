import 'package:modavest_core/data/models/item_sales_order/item_sales_order_hive.dart';
import 'package:modavest_core/data/models/reference/reference_model.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';

class ItemSalesOrderModel extends ItemSalesOrder {
  ItemSalesOrderModel({
    required super.integrationId,
    required super.orderId,
    required super.sequenceItem,
    required super.productCode,
    required super.productSku,
    super.productName,
    required super.referenceCode,
    required super.referenceName,
    required super.colorCode,
    super.colorName,
    super.sizeName,
    required super.quantity,
    super.originalPrice,
    required super.price,
    super.discountPercentage,
    super.billingForecastDate,
    // TODO: remover se necessário
    // ReferenceModel? super.reference,
    required super.referenceIsPack,
    required super.scaleCode,
    super.settledQuantity,
  });

  factory ItemSalesOrderModel.fromJson(Map json) {
    return ItemSalesOrderModel(
      integrationId: json["integrationId"] as int?,
      orderId: json["orderId"] as String?,
      sequenceItem: json["sequenceItem"] as num?,
      productCode: json["productCode"] as num,
      productSku: json["productSku"] as String?,
      productName: json["productName"] as String?,
      referenceCode: json["referenceCode"] as String?,
      referenceName: json["referenceName"] as String?,
      colorCode: json["colorCode"] as String?,
      colorName: json["colorName"] as String?,
      sizeName: json["sizeName"] as String?,
      quantity: (json["quantity"] as num?) ?? json["Quantity"] as num?,
      settledQuantity:
          (json["settledQuantity"] as num?) ?? json["settledQuantity"] as num?,
      originalPrice: json["originalPrice"] as num?,
      price: json["price"] as num,
      discountPercentage: json["discountPercentage"] as num?,
      billingForecastDate: json["billingForecastDate"] != null
          ? DateTime.parse(json["billingForecastDate"] as String)
          : null,
      referenceIsPack: false,
      scaleCode: json["scaleCode"] as num?,
    );
  }
  factory ItemSalesOrderModel.fromHive(HiveItemSalesOrder hive) {
    return ItemSalesOrderModel(
      integrationId: hive.integrationId,
      orderId: hive.orderId,
      sequenceItem: hive.sequenceItem,
      productCode: hive.productCode,
      productSku: hive.productSku,
      productName: hive.productName,
      referenceCode: hive.referenceCode,
      referenceName: hive.referenceName,
      colorCode: hive.colorCode,
      colorName: hive.colorName,
      sizeName: hive.sizeName,
      quantity: hive.quantity,
      settledQuantity: hive.settledQuantity,
      originalPrice: hive.originalPrice,
      price: hive.price,
      discountPercentage: hive.discountPercentage,
      billingForecastDate: hive.billingForecastDate,
      // TODO: remover se necessário
      // reference: hive.reference != null
      //     ? ReferenceModel.fromHive(hive.reference!)
      //     : null,
      referenceIsPack: hive.referenceIsPack,
      scaleCode: hive.scaleCode,
    );
  }
  factory ItemSalesOrderModel.entity(ItemSalesOrder item) {
    return ItemSalesOrderModel(
      integrationId: item.integrationId,
      orderId: item.orderId,
      sequenceItem: item.sequenceItem,
      productCode: item.productCode,
      productSku: item.productSku,
      productName: item.productName,
      referenceCode: item.referenceCode,
      referenceName: item.referenceName,
      colorCode: item.colorCode,
      colorName: item.colorName,
      sizeName: item.sizeName,
      quantity: item.quantity,
      settledQuantity: item.settledQuantity,
      originalPrice: item.originalPrice,
      price: item.price,
      discountPercentage: item.discountPercentage,
      billingForecastDate: item.billingForecastDate,
      //  TODO: remover se necessário
      // referenceSimple: item.referenceSimple != null
      //     ? ReferenceModel.entity(item.reference!)
      //     : null,
      referenceIsPack: item.referenceIsPack,
      scaleCode: item.scaleCode,
    );
  }

  HiveItemSalesOrder toHive() {
    return HiveItemSalesOrder(
      integrationId: integrationId,
      orderId: orderId,
      sequenceItem: sequenceItem,
      productCode: productCode,
      productSku: productSku,
      productName: productName,
      referenceCode: referenceCode,
      referenceName: referenceName,
      colorCode: colorCode,
      colorName: colorName,
      sizeName: sizeName,
      quantity: quantity,
      settledQuantity: settledQuantity,
      originalPrice: originalPrice,
      price: price,
      discountPercentage: discountPercentage,
      billingForecastDate: billingForecastDate,
      referenceIsPack: referenceIsPack,
      scaleCode: scaleCode,
    );
  }

  dynamic toJson() {
    return {
      "integrationId": integrationId,
      "orderId": orderId,
      "sequenceItem": sequenceItem,
      "productCode": productCode,
      "productSku": productSku,
      "productName": productName,
      "referenceCode": referenceCode,
      "referenceName": referenceName,
      "colorCode": colorCode,
      "colorName": colorName,
      "sizeName": sizeName,
      "quantity": quantity,
      "settledQuantity": settledQuantity,
      "originalPrice": originalPrice,
      "price": price,
      "discountPercentage": discountPercentage,
      "billingForecastDate": billingForecastDate,
      "referenceIsPack": referenceIsPack,
      "scaleCode": scaleCode,
    };
  }
}
