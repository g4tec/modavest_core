class FreightQuote {
  final num freightValue;
  final String shippingCompanyCpfCnpj;
  final String shippingCompanyName;
  final num? shippingCompanyCode;
  final num deliveryEstimateBusinessDays;
  final String deliveryMethodName;

  FreightQuote({
    required this.freightValue,
    required this.shippingCompanyCpfCnpj,
    required this.shippingCompanyName,
    required this.deliveryEstimateBusinessDays,
    required this.deliveryMethodName,
    required this.shippingCompanyCode,
  });
}
