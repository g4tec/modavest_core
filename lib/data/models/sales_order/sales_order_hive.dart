import 'package:hive/hive.dart';

import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/data/models/item_sales_order/item_sales_order_hive.dart';

part 'sales_order_hive.g.dart';

@HiveType(typeId: 13)
class HiveSalesOrder extends HiveObject {
  @HiveField(1)
  final int? integrationId;
  @HiveField(2)
  final String? orderId;
  @HiveField(3)
  final num? branchCode;
  @HiveField(4)
  final String? customerOrderCode;
  @HiveField(5)
  final String? integrationCode;
  @HiveField(6)
  final num? orderCode;
  @HiveField(7)
  final DateTime? orderDate;
  @HiveField(8)
  final num? customerCode;
  @HiveField(9)
  final String? customerCnpj;
  @HiveField(10)
  final num? representativeCode;
  @HiveField(11)
  final String? representativeCnpj;
  @HiveField(12)
  final num? sellerCode;
  @HiveField(13)
  final String? sellerCpf;
  @HiveField(14)
  final num? purchasingGuideCode;
  @HiveField(15)
  final String? cnpjPurchasingGuide;
  @HiveField(16)
  final num? operationCode;
  @HiveField(17)
  num? paymentConditionCode;
  @HiveField(18)
  String? paymentConditionName;
  @HiveField(19)
  final double? quantity;
  @HiveField(20)
  final double? grossValue;
  @HiveField(21)
  final num? discountValue;
  @HiveField(22)
  final double? netValue;
  @HiveField(23)
  final num? priorityCode;
  @HiveField(24)
  final num? shippingCompanyCode;
  @HiveField(25)
  final String? shippingCompanyCpfCnpj;
  @HiveField(26)
  final DateTime? billingForecastDate;
  @HiveField(27)
  final num? freightType;
  @HiveField(28)
  final double? freightPercentage;
  @HiveField(29)
  final double? freightValue;
  @HiveField(30)
  final double? packageint;
  @HiveField(31)
  final double? weight;
  @HiveField(32)
  double? totalAmountOrder;
  @HiveField(33)
  final String? statusOrder;
  @HiveField(35)
  final String? customerName;
  @HiveField(34)
  HiveList<HiveItemSalesOrder>? items;
  @HiveField(36)
  num officialStoreId;
  @HiveField(37)
  num? priceTableCode;
  @HiveField(38)
  HiveList<HiveDiscount>? discounts;
  @HiveField(39)
  double? totalOriginalAmountOrder;
  @HiveField(40)
  num? discountPercentage;
  @HiveField(41)
  late List<String?>? observations = [];

  HiveSalesOrder({
    required this.integrationId,
    required this.orderId,
    this.branchCode,
    this.customerOrderCode,
    this.integrationCode,
    this.orderCode,
    required this.orderDate,
    required this.customerCode,
    required this.customerCnpj,
    this.representativeCode,
    this.representativeCnpj,
    this.sellerCode,
    this.sellerCpf,
    this.purchasingGuideCode,
    this.cnpjPurchasingGuide,
    this.operationCode,
    this.paymentConditionCode,
    this.paymentConditionName,
    this.quantity,
    this.grossValue,
    this.discountValue,
    this.netValue,
    this.priorityCode,
    this.shippingCompanyCode,
    this.shippingCompanyCpfCnpj,
    this.billingForecastDate,
    this.freightType,
    this.freightPercentage,
    this.freightValue,
    this.packageint,
    this.weight,
    this.totalAmountOrder,
    this.statusOrder,
    this.items,
    this.customerName,
    required this.officialStoreId,
    required this.priceTableCode,
    this.totalOriginalAmountOrder,
    this.discountPercentage,
  });
}
