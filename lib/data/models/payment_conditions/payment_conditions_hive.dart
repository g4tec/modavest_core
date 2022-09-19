import 'package:hive/hive.dart';
part 'payment_conditions_hive.g.dart';

@HiveType(typeId: 32)
class HivePaymentConditions extends HiveObject {
  @HiveField(0)
  final num code;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? installment;
  // @HiveField(3)
  // // final num? variationPercentage;
  @HiveField(4)
  final String? interestPercentage;
  @HiveField(5)
  final bool? isBlocked;
  @HiveField(6)
  final bool? isActive;
  @HiveField(7)
  final List<String?>? installmentDays;
  @HiveField(8)
  final num? priceTable;
  @HiveField(9)
  final num? officialStore;
  @HiveField(10)
  final bool isDefault;
  // @HiveField(11)
  // final num? variationValue;

  HivePaymentConditions({
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
  });
}
