import 'package:modavest_core/domain/models/average_period.dart';

class PaymentConditions {
  final num code;
  final String name;
  final String? installment;
  // final num? variationPercentage;
  final String? interestPercentage;
  final bool? isBlocked;
  final bool? isActive;
  final List<String?>? installmentDays;
  final num? priceTable;
  final num? officialStore;
  final bool isDefault;
  // final num? variationValue;
  AveragePeriod? averagePeriod;
  PaymentConditions({
    required this.code,
    required this.name,
    required this.installment,
    // required this.variationPercentage,
    required this.interestPercentage,
    required this.isBlocked,
    required this.isActive,
    required this.installmentDays,
    required this.priceTable,
    required this.officialStore,
    required this.isDefault,
    // required this.variationValue,
    this.averagePeriod,
  });
}
