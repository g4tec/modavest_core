class CreditCardInfos {
  final String holderName;
  final String expirationMonth;
  final String expirationYear;
  final String cardNumber;
  final String? securityCode;
  final String? token;

  CreditCardInfos({
    required this.holderName,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cardNumber,
    this.securityCode,
    this.token,
  });
}
