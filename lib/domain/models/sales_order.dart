import 'package:modavest_core/assets/moda_vest_bag_status_enum.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/category_item_sales_order.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';
import 'package:modavest_core/domain/models/discount.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/official_store.dart';
import 'package:modavest_core/domain/models/official_store_sales_questions.dart';
import 'package:modavest_core/domain/models/sales_order_classification.dart';
import 'package:modavest_core/domain/models/sales_order_observation.dart';

class SalesOrder {
  final int? integrationId;
  // Not required on app
  final String? orderId;
  // Not required on app
  final num? branchCode;
  final String? customerOrderCode;
  final String? integrationCode;
  final num? orderCode;
  final DateTime? orderDate;
  final num? customerCode;
  final String? customerCnpj;
  final num? representativeCode;
  final String? representativeCnpj;
  final num? sellerCode;
  final String? sellerCpf;
  final num? purchasingGuideCode;
  final String? cnpjPurchasingGuide;
  // Not required on app
  final num? operationCode;
  num? paymentConditionCode;
  String? paymentConditionName;
  double? quantity;
  final double? grossValue;
  final num? discountValue;
  final double? netValue;
  // Not required on app
  final num? priorityCode;
  final num? shippingCompanyCode;
  final String? shippingCompanyCpfCnpj;
  final DateTime? billingForecastDate;
  final num? freightType;
  final double? freightPercentage;
  final double? freightValue;
  final double? packageint;
  final double? weight;
  // Can be null on app when initialized
  double? totalAmountOrder;
  // Not required on app
  final String? statusOrder;
  final String? customerName;
  List<ItemSalesOrder>? items;
  List<ColorItemSalesOrder> colorItems;
  OficialStore? oficialStore;
  Map<String, dynamic>? payload;
  String? stackTrace;
  num? sequence;
  final num? officialStoreId;
  List<SalesOrderObservation?> observations;
  List<SalesOrderObservation?> representativeObservations;
  EnumStatusBag status;

  num? priceTableCode;
  List<Discount>? discounts;
  double? totalOriginalAmountOrder;
  num? discountPercentage;
  DateTime? arrivalDate;
  String? shippingCompanyName;
  List<SalesOrderClassification>? classifications;
  num? chargeType;
  List<ImageColorReference>? imageColorsReferences;

  Address? shippingAddress;
  List<OfficialStoreSalesQuestions>? officialStoreSalesQuestions;

  SalesOrder({
    this.integrationId,
    this.orderId,
    this.branchCode,
    required this.orderDate,
    this.oficialStore,
    required this.customerCode,
    required this.officialStoreId,
    this.customerCnpj,
    this.operationCode,
    this.priorityCode,
    this.totalAmountOrder,
    this.statusOrder,
    this.customerOrderCode,
    this.integrationCode,
    this.orderCode,
    this.representativeCode,
    this.representativeCnpj,
    this.sellerCode,
    this.sellerCpf,
    this.purchasingGuideCode,
    this.cnpjPurchasingGuide,
    this.paymentConditionCode,
    this.paymentConditionName,
    this.quantity,
    this.grossValue,
    this.discountValue,
    this.netValue,
    this.shippingCompanyCode,
    this.shippingCompanyCpfCnpj,
    this.billingForecastDate,
    this.freightType,
    this.freightPercentage,
    this.freightValue,
    this.packageint,
    this.weight,
    this.items,
    this.customerName,
    this.colorItems = const [],
    this.sequence,
    this.stackTrace,
    this.payload,
    this.observations = const [],
    required this.priceTableCode,
    this.discounts,
    this.totalOriginalAmountOrder,
    this.discountPercentage,
    this.arrivalDate,
    this.shippingCompanyName,
    this.classifications,
    this.shippingAddress,
    this.chargeType,
    this.representativeObservations = const [],
    this.imageColorsReferences,
    this.status = EnumStatusBag.other,
    this.officialStoreSalesQuestions,
  });

  SalesOrder copyWith({
    String? orderId,
    double? totalAmountOrder,
    double? totalOriginalAmountOrder,
    List<ItemSalesOrder>? items,
    num? paymentConditionCode,
    String? paymentConditionName,
    num? priceTableCode,
    List<OfficialStoreSalesQuestions>? officialStoreSalesQuestions,
  }) {
    return SalesOrder(
      integrationId: integrationId,
      orderId: orderId,
      branchCode: branchCode,
      orderDate: orderDate,
      oficialStore: oficialStore,
      customerCode: customerCode,
      officialStoreId: officialStoreId,
      customerCnpj: customerCnpj,
      operationCode: operationCode,
      priorityCode: priorityCode,
      totalAmountOrder: totalAmountOrder ?? this.totalAmountOrder,
      statusOrder: statusOrder,
      customerOrderCode: customerOrderCode,
      integrationCode: integrationCode,
      orderCode: orderCode,
      representativeCode: representativeCode,
      representativeCnpj: representativeCnpj,
      sellerCode: sellerCode,
      sellerCpf: sellerCpf,
      purchasingGuideCode: purchasingGuideCode,
      cnpjPurchasingGuide: cnpjPurchasingGuide,
      paymentConditionCode: paymentConditionCode ?? this.paymentConditionCode,
      paymentConditionName: paymentConditionName ?? this.paymentConditionName,
      quantity: quantity,
      grossValue: grossValue,
      discountValue: discountValue,
      netValue: netValue,
      shippingCompanyCode: shippingCompanyCode,
      shippingCompanyCpfCnpj: shippingCompanyCpfCnpj,
      billingForecastDate: billingForecastDate,
      freightType: freightType,
      freightPercentage: freightPercentage,
      freightValue: freightValue,
      packageint: packageint,
      weight: weight,
      items: items ?? this.items?.map((e) => ItemSalesOrder.copy(e)).toList(),
      customerName: customerName,
      colorItems: colorItems,
      sequence: sequence,
      stackTrace: stackTrace,
      payload: payload,
      observations: observations,
      priceTableCode: priceTableCode ?? this.priceTableCode,
      discounts: discounts,
      totalOriginalAmountOrder:
          totalOriginalAmountOrder ?? this.totalOriginalAmountOrder,
      discountPercentage: discountPercentage,
      arrivalDate: arrivalDate,
      shippingCompanyName: shippingCompanyName,
      classifications: classifications,
      shippingAddress: shippingAddress,
      chargeType: chargeType,
      imageColorsReferences: imageColorsReferences,
      officialStoreSalesQuestions:
          officialStoreSalesQuestions ?? this.officialStoreSalesQuestions,
    );
  }

  factory SalesOrder.copy(SalesOrder order) {
    return SalesOrder(
      integrationId: order.integrationId,
      orderId: order.orderId,
      branchCode: order.branchCode,
      orderDate: order.orderDate,
      oficialStore: order.oficialStore,
      customerCode: order.customerCode,
      officialStoreId: order.officialStoreId,
      customerCnpj: order.customerCnpj,
      operationCode: order.operationCode,
      priorityCode: order.priorityCode,
      totalAmountOrder: order.totalAmountOrder,
      statusOrder: order.statusOrder,
      customerOrderCode: order.customerOrderCode,
      integrationCode: order.integrationCode,
      orderCode: order.orderCode,
      representativeCode: order.representativeCode,
      representativeCnpj: order.representativeCnpj,
      sellerCode: order.sellerCode,
      sellerCpf: order.sellerCpf,
      purchasingGuideCode: order.purchasingGuideCode,
      cnpjPurchasingGuide: order.cnpjPurchasingGuide,
      paymentConditionCode: order.paymentConditionCode,
      paymentConditionName: order.paymentConditionName,
      quantity: order.quantity,
      grossValue: order.grossValue,
      discountValue: order.discountValue,
      netValue: order.netValue,
      shippingCompanyCode: order.shippingCompanyCode,
      shippingCompanyCpfCnpj: order.shippingCompanyCpfCnpj,
      billingForecastDate: order.billingForecastDate,
      freightType: order.freightType,
      freightPercentage: order.freightPercentage,
      freightValue: order.freightValue,
      packageint: order.packageint,
      weight: order.weight,
      items: order.items?.map((e) => ItemSalesOrder.copy(e)).toList(),
      customerName: order.customerName,
      colorItems: order.colorItems,
      sequence: order.sequence,
      stackTrace: order.stackTrace,
      payload: order.payload,
      observations: order.observations,
      priceTableCode: order.priceTableCode,
      discounts: order.discounts,
      totalOriginalAmountOrder: order.totalOriginalAmountOrder,
      discountPercentage: order.discountPercentage,
      arrivalDate: order.arrivalDate,
      shippingCompanyName: order.shippingCompanyName,
      classifications: order.classifications,
      shippingAddress: order.shippingAddress,
      chargeType: order.chargeType,
      imageColorsReferences: order.imageColorsReferences,
      officialStoreSalesQuestions: order.officialStoreSalesQuestions,
    );
  }
}
