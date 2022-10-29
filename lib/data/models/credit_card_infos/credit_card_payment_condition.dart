import 'package:modavest_core/domain/models/credit_card_payment_condition.dart';

class CrediCartPaymentConditionModel extends CrediCartPaymentCondition {
  CrediCartPaymentConditionModel({
    required super.cardToken,
    required super.installment,
    super.code = -1,
  });

  factory CrediCartPaymentConditionModel.entity(
      CrediCartPaymentCondition crediCartPaymentCondition) {
    return CrediCartPaymentConditionModel(
      cardToken: crediCartPaymentCondition.cardToken,
      installment: crediCartPaymentCondition.installment,
      code: crediCartPaymentCondition.code,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cardToken": cardToken,
      "installment": installment,
      "code": code,
    };
  }
}
