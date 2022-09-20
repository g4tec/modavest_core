import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/data/models/discount/discount_model.dart';
import 'package:modavest_core/data/models/item_sales_order/item_sales_order_hive.dart';
import 'package:modavest_core/data/models/item_sales_order/item_sales_order_model.dart';
import 'package:modavest_core/data/models/sales_order/sales_order_hive.dart';
import 'package:modavest_core/domain/models/discount.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

class SalesOrderModel extends SalesOrder {
  SalesOrderModel({
    super.integrationId,
    super.orderId,
    super.branchCode,
    super.customerOrderCode,
    super.integrationCode,
    super.orderCode,
    required super.orderDate,
    super.customerCode,
    super.customerCnpj,
    super.representativeCode,
    super.representativeCnpj,
    super.sellerCode,
    super.sellerCpf,
    super.purchasingGuideCode,
    super.cnpjPurchasingGuide,
    super.operationCode,
    num? paymentConditionCode,
    super.paymentConditionName,
    super.quantity,
    super.grossValue,
    super.discountValue,
    super.discountPercentage,
    super.netValue,
    super.priorityCode,
    super.shippingCompanyCode,
    super.shippingCompanyCpfCnpj,
    super.billingForecastDate,
    super.freightType,
    super.freightPercentage,
    super.freightValue,
    super.packageint,
    super.weight,
    super.totalAmountOrder,
    super.statusOrder,
    super.customerName,
    List<ItemSalesOrderModel> super.items = const [],
    super.payload,
    super.stackTrace,
    super.sequence,
    required super.officialStoreId,
    super.observations,
    List<DiscountModel>? super.discounts = const [],
    required super.priceTableCode,
    super.totalOriginalAmountOrder,
  }) : super(
          paymentconditionCode: paymentConditionCode,
        );
  factory SalesOrderModel.fromJson(Map json) {
    return SalesOrderModel(
      payload: json["payload"] as Map<String, dynamic>?,
      stackTrace: json["stacktrace"] as String?,
      sequence: json["sequence"] as num?,
      integrationId: json["integrationId"] as int?,
      orderId: json["orderId"] as String?,
      branchCode: json["branchCode"] as num?,
      customerOrderCode: json["customerOrderCode"] as String?,
      integrationCode: json["integrationCode"] as String?,
      orderCode: json["orderCode"] as num?,
      orderDate: json["orderDate"] != null
          ? DateTime.parse(json["orderDate"] as String)
          : null,
      customerCode: json["customerCode"] as num?,
      customerCnpj:
          json["customerCnpj"] as String? ?? json["customerCpfCnpj"] as String?,
      representativeCode: json["representativeCode"] as num?,
      representativeCnpj: json["representativeCnpj"] as String?,
      sellerCode: json["sellerCode"] as num?,
      sellerCpf: json["sellerCpf"] as String?,
      purchasingGuideCode: json["purchasingGuideCode"] as num?,
      cnpjPurchasingGuide: json["cnpjPurchasingGuide"] as String?,
      operationCode: json["operationCode"] as num?,
      paymentConditionCode: json["paymentconditionCode"] as num?,
      paymentConditionName: json["paymentConditionName"] as String?,
      customerName: json["customerName"] as String?,
      quantity: ((json["quantity"] is int)
              ? (json["quantity"] as int).toDouble()
              : json["quantity"] as double?) ??
          ((json["Quantity"] is int)
              ? (json["Quantity"] as int).toDouble()
              : json["Quantity"] as double?),
      grossValue: (json["grossValue"] is int)
          ? (json["grossValue"] as int).toDouble()
          : json["grossValue"] as double?,
      discountValue: (json["discountValue"] is int)
          ? (json["discountValue"] as int).toDouble()
          : json["discountValue"] as double?,
      netValue: (json["netValue"] is int)
          ? (json["netValue"] as int).toDouble()
          : json["netValue"] as double?,
      priorityCode: json["priorityCode"] as num?,
      shippingCompanyCode: json["shippingCompanyCode"] as num?,
      shippingCompanyCpfCnpj: json["shippingCompanyCpfCnpj"] as String?,
      billingForecastDate: json["billingForecastDate"] != null
          ? DateTime.parse(json["billingForecastDate"] as String)
          : null,
      freightType: json["freightType"] as num?,
      freightPercentage: json["freightPercentage"] is int
          ? (json["freightPercentage"] as int).toDouble()
          : json["freightPercentage"] as double?,
      freightValue: json["freightValue"] is int
          ? (json["freightValue"] as int).toDouble()
          : json["freightValue"] as double?,
      packageint: json["packageint"] is int
          ? (json["packageint"] as int).toDouble()
          : json["packageint"] as double?,
      weight: json["weight"] as double?,
      totalAmountOrder: json["totalAmountOrder"] is int
          ? (json["totalAmountOrder"] as int).toDouble()
          : json["totalAmountOrder"] as double?,
      statusOrder: json["statusOrder"]?.toString(),
      items: ((json["items"] ?? []) as List)
          .map((value) => ItemSalesOrderModel.fromJson(value as Map))
          .toList(),
      officialStoreId: json["officialStoreId"] as num?,
      observations: (json["observations"] as List? ?? [])
          .map((e) => (e as Map)["observation"] as String?)
          .toList(),
      priceTableCode: json["priceTableCode"] as num? ?? 0,
    );
  }

  factory SalesOrderModel.fromHive(HiveSalesOrder hive) {
    return SalesOrderModel(
      integrationId: hive.integrationId,
      orderId: hive.orderId,
      branchCode: hive.branchCode,
      customerOrderCode: hive.customerOrderCode,
      integrationCode: hive.integrationCode,
      orderCode: hive.orderCode,
      orderDate: hive.orderDate,
      customerCode: hive.customerCode,
      customerCnpj: hive.customerCnpj,
      representativeCode: hive.representativeCode,
      representativeCnpj: hive.representativeCnpj,
      sellerCode: hive.sellerCode,
      sellerCpf: hive.sellerCpf,
      purchasingGuideCode: hive.purchasingGuideCode,
      cnpjPurchasingGuide: hive.cnpjPurchasingGuide,
      operationCode: hive.operationCode,
      paymentConditionCode: hive.paymentConditionCode,
      paymentConditionName: hive.paymentConditionName,
      quantity: hive.quantity,
      grossValue: hive.grossValue,
      discountValue: hive.discountValue,
      netValue: hive.netValue,
      priorityCode: hive.priorityCode,
      shippingCompanyCode: hive.shippingCompanyCode,
      shippingCompanyCpfCnpj: hive.shippingCompanyCpfCnpj,
      billingForecastDate: hive.billingForecastDate,
      freightType: hive.freightType,
      freightPercentage: hive.freightPercentage,
      freightValue: hive.freightValue,
      packageint: hive.packageint,
      weight: hive.weight,
      totalAmountOrder: hive.totalAmountOrder,
      statusOrder: hive.statusOrder,
      customerName: hive.customerName,
      items: hive.items
              ?.map((HiveItemSalesOrder e) => ItemSalesOrderModel.fromHive(e))
              .toList() ??
          [],
      discounts: hive.discounts
              ?.map((HiveDiscount e) => DiscountModel.fromHive(e))
              .toList() ??
          [],
      officialStoreId: hive.officialStoreId,
      observations: hive.observations,
      priceTableCode: hive.priceTableCode,
      totalOriginalAmountOrder: hive.totalOriginalAmountOrder,
      discountPercentage: hive.discountPercentage,
    );
  }

  factory SalesOrderModel.entiy(SalesOrder order) {
    return SalesOrderModel(
      integrationId: order.integrationId,
      orderId: order.orderId,
      branchCode: order.branchCode,
      customerOrderCode: order.customerOrderCode,
      integrationCode: order.integrationCode,
      orderCode: order.orderCode,
      orderDate: order.orderDate,
      customerCode: order.customerCode,
      customerCnpj: order.customerCnpj,
      representativeCode: order.representativeCode,
      representativeCnpj: order.representativeCnpj,
      sellerCode: order.sellerCode,
      sellerCpf: order.sellerCpf,
      purchasingGuideCode: order.purchasingGuideCode,
      cnpjPurchasingGuide: order.cnpjPurchasingGuide,
      operationCode: order.operationCode,
      paymentConditionCode: order.paymentconditionCode,
      paymentConditionName: order.paymentConditionName,
      quantity: order.quantity,
      grossValue: order.grossValue,
      discountValue: order.discountValue,
      netValue: order.netValue,
      priorityCode: order.priorityCode,
      shippingCompanyCode: order.shippingCompanyCode,
      shippingCompanyCpfCnpj: order.shippingCompanyCpfCnpj,
      billingForecastDate: order.billingForecastDate,
      freightType: order.freightType,
      freightPercentage: order.freightPercentage,
      freightValue: order.freightValue,
      packageint: order.packageint,
      weight: order.weight,
      totalAmountOrder: order.totalAmountOrder,
      statusOrder: order.statusOrder,
      customerName: order.customerName,
      items: order.items
              ?.map((ItemSalesOrder e) => ItemSalesOrderModel.entity(e))
              .toList() ??
          [],
      discounts: order.discounts
              ?.map((Discount e) => DiscountModel.fromEntitie(e))
              .toList() ??
          [],
      officialStoreId: order.officialStoreId,
      priceTableCode: order.priceTableCode,
      totalOriginalAmountOrder: order.totalOriginalAmountOrder,
      discountPercentage: order.discountPercentage,
      observations: order.observations,
    );
  }

  HiveSalesOrder toHive() {
    return HiveSalesOrder(
      integrationId: integrationId,
      orderId: orderId,
      branchCode: branchCode,
      customerOrderCode: customerOrderCode,
      integrationCode: integrationCode,
      orderCode: orderCode,
      orderDate: orderDate,
      customerCode: customerCode,
      customerCnpj: customerCnpj,
      customerName: customerName,
      representativeCode: representativeCode,
      representativeCnpj: representativeCnpj,
      sellerCode: sellerCode,
      sellerCpf: sellerCpf,
      purchasingGuideCode: purchasingGuideCode,
      cnpjPurchasingGuide: cnpjPurchasingGuide,
      operationCode: operationCode,
      paymentConditionCode: paymentconditionCode,
      paymentConditionName: paymentConditionName,
      quantity: quantity,
      grossValue: grossValue,
      discountValue: discountValue,
      netValue: netValue,
      priorityCode: priorityCode,
      shippingCompanyCode: shippingCompanyCode,
      shippingCompanyCpfCnpj: shippingCompanyCpfCnpj,
      billingForecastDate: billingForecastDate,
      freightType: freightType,
      freightPercentage: freightPercentage,
      freightValue: freightValue,
      packageint: packageint,
      weight: weight,
      totalAmountOrder: totalAmountOrder,
      statusOrder: statusOrder,
      officialStoreId: officialStoreId!,
      priceTableCode: priceTableCode,
      totalOriginalAmountOrder: totalOriginalAmountOrder,
      discountPercentage: discountPercentage,
    );
  }
}
