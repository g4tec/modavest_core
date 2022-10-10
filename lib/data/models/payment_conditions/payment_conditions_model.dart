import 'package:modavest_core/data/models/average_period/average_period_model.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_hive.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';

class PaymentConditionsModel extends PaymentConditions {
  PaymentConditionsModel({
    required num code,
    required String name,
    required String? installment,
    required num? variationPercentage,
    required String? interestPercentage,
    required bool? isBlocked,
    required bool? isActive,
    required List<String?>? installmentDays,
    required num? priceTable,
    required num? officialStore,
    required bool isDefault,
    required num? variationValue,
    AveragePeriodModel? averagePeriod,
  }) : super(
          code: code,
          name: name,
          installment: installment,
          variationPercentage: variationPercentage,
          interestPercentage: interestPercentage,
          isBlocked: isBlocked,
          isActive: isActive,
          installmentDays: installmentDays,
          priceTable: priceTable,
          officialStore: officialStore,
          isDefault: isDefault,
          variationValue: variationValue,
          averagePeriod: averagePeriod,
        );

  factory PaymentConditionsModel.fromJson(
    Map json, {
    num? priceTable,
    num? officialStore,
  }) {
    PaymentConditionsModel? paymentConditionAux;
    if (json["paymentCondition"] != null) {
      if (json["paymentCondition"] is Map) {
        paymentConditionAux =
            PaymentConditionsModel.fromJson(json['paymentCondition'] as Map);
      }
    }
    return PaymentConditionsModel(
      code: json['code'] as num? ?? json["paymentConditionCode"] as num,
      name: json['name'] as String,
      installment:
          paymentConditionAux?.installment ?? json['installment'] as String?,
      variationPercentage: paymentConditionAux?.variationPercentage ??
          json['variationPercentage'] as num? ??
          json['discountPercentage'] as num?,
      variationValue: paymentConditionAux?.variationValue ??
          json['variationValue'] as num? ??
          json['discountValue'] as num?,
      interestPercentage: paymentConditionAux?.interestPercentage ??
          json['interestPercentage'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      isActive: json['isActive'] as bool?,
      installmentDays: paymentConditionAux?.installmentDays ??
          paymentConditionAux?.installmentDays ??
          (json['installmentDays'] as List?)?.map((e) => e as String?).toList(),
      priceTable: priceTable,
      officialStore: officialStore,
      isDefault: json["isStandard"] as bool? ?? false,
    );
  }
  factory PaymentConditionsModel.fromHive(
    HivePaymentConditions hivePaymentConditions,
  ) {
    return PaymentConditionsModel(
      code: hivePaymentConditions.code,
      name: hivePaymentConditions.name,
      installment: hivePaymentConditions.installment,
      variationPercentage: hivePaymentConditions.variationPercentage,
      interestPercentage: hivePaymentConditions.interestPercentage,
      isBlocked: hivePaymentConditions.isBlocked,
      isActive: hivePaymentConditions.isActive,
      installmentDays: hivePaymentConditions.installmentDays,
      priceTable: hivePaymentConditions.priceTable,
      officialStore: hivePaymentConditions.officialStore,
      isDefault: hivePaymentConditions.isDefault,
      variationValue: hivePaymentConditions.variationValue,
    );
  }

  HivePaymentConditions toHive() {
    return HivePaymentConditions(
      code: code,
      name: name,
      installment: installment,
      variationPercentage: variationPercentage,
      interestPercentage: interestPercentage,
      isBlocked: isBlocked,
      isActive: isActive,
      installmentDays: installmentDays,
      priceTable: priceTable,
      officialStore: officialStore,
      isDefault: isDefault,
      variationValue: variationValue,
    );
  }
}
