class CrediCartPaymentCondition {
  final String cardToken;
  final String installment;
  final num code;

  CrediCartPaymentCondition({
    required this.cardToken,
    required this.installment,
    this.code = -1,
  });
}
