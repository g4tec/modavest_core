import 'package:modavest_core/domain/models/payment_types.dart';

class PaymentTypesModel extends PaymentTypes {
  PaymentTypesModel({
    super.saleType,
    super.paymentType,
    super.officialStoreId,
    super.integrationId,
    super.isAccept,
    super.isAcceptWithGuide,
    super.isAcceptWithRepresentative,
    super.isAcceptWithGuideOrRepresentative,
    super.isNotAccept,
    super.isNotAcceptWithGuide,
    super.isNotAcceptWithRepresentative,
    super.isNotAcceptWithGuideOrRepresentative,
  });

  factory PaymentTypesModel.fromJson(Map json) {
    return PaymentTypesModel(
      saleType: json["saleType"],
      paymentType: json["paymentType"],
      officialStoreId: json["officialStoreId"],
      integrationId: json["integrationId"],
      isAccept: json["isAccept"],
      isAcceptWithGuide: json["isAcceptWithGuide"],
      isAcceptWithRepresentative: json["isAcceptWithRepresentative"],
      isAcceptWithGuideOrRepresentative:
          json["isAcceptWithGuideOrRepresentative"],
      isNotAccept: json["isNotAccept"],
      isNotAcceptWithGuide: json["isNotAcceptWithGuide"],
      isNotAcceptWithRepresentative: json["isNotAcceptWithRepresentative"],
      isNotAcceptWithGuideOrRepresentative:
          json["isNotAcceptWithGuideOrRepresentative"],
    );
  }
}
