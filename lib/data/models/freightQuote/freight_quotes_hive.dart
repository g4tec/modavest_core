import 'package:hive_flutter/hive_flutter.dart';

part 'freight_quotes_hive.g.dart';

@HiveType(typeId: 55)
class HiveFreightQuote extends HiveObject {
  @HiveField(0)
  final num freightValue;
  @HiveField(1)
  final String shippingCompanyCpfCnpj;
  @HiveField(2)
  final String shippingCompanyName;
  @HiveField(3)
  final num deliveryEstimateBusinessDays;
  @HiveField(4)
  final String deliveryMethodName;
  @HiveField(5)
  final num? shippingCompanyCode;

  HiveFreightQuote({
    required this.freightValue,
    required this.shippingCompanyCpfCnpj,
    required this.shippingCompanyName,
    required this.deliveryEstimateBusinessDays,
    required this.deliveryMethodName,
    required this.shippingCompanyCode,
  });
}
