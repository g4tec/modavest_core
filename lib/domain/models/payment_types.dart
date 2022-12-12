class PaymentTypes {
  final String? saleType;
  final String? paymentType;
  final num? officialStoreId;
  final num? integrationId;
  final bool? isAccept;
  final bool? isAcceptWithGuide;
  final bool? isAcceptWithRepresentative;
  final bool? isAcceptWithGuideOrRepresentative;
  final bool? isNotAccept;
  final bool? isNotAcceptWithGuide;
  final bool? isNotAcceptWithRepresentative;
  final bool? isNotAcceptWithGuideOrRepresentative;

  PaymentTypes({
    this.saleType,
    this.paymentType,
    this.officialStoreId,
    this.integrationId,
    this.isAccept,
    this.isAcceptWithGuide,
    this.isAcceptWithRepresentative,
    this.isAcceptWithGuideOrRepresentative,
    this.isNotAccept,
    this.isNotAcceptWithGuide,
    this.isNotAcceptWithRepresentative,
    this.isNotAcceptWithGuideOrRepresentative,
  });
}
