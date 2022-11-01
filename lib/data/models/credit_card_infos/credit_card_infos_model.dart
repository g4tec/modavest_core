import 'package:modavest_core/widgets/fields/credit_card_infos.dart';

class CreditCardInfosModel extends CreditCardInfos {
  CreditCardInfosModel({
    required super.holderName,
    required super.expirationMonth,
    required super.expirationYear,
    required super.cardNumber,
    required super.securityCode,
    super.token,
  });

  factory CreditCardInfosModel.entity(CreditCardInfos creditCardInfos) {
    return CreditCardInfosModel(
        holderName: creditCardInfos.holderName,
        expirationMonth: creditCardInfos.expirationMonth,
        expirationYear: creditCardInfos.expirationYear,
        cardNumber: creditCardInfos.cardNumber,
        securityCode: creditCardInfos.securityCode);
  }

  factory CreditCardInfosModel.fromJson(Map<String, dynamic> json) {
    return CreditCardInfosModel(
      holderName: json["holder_name"] as String,
      expirationMonth: json["expiration_month"] as String,
      expirationYear: json["expiration_year"] as String,
      cardNumber: "${json["first4_digits"]} **** **** ${json["last4_digits"]}",
      securityCode: "***",
      token: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'holder_name': holderName,
      'expiration_month': expirationMonth,
      'expiration_year': expirationYear,
      'card_number': cardNumber.replaceAll(" ", ""),
      'security_code': securityCode,
    };
  }
}
