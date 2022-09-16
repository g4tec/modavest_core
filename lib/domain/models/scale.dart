class Scale {
  final num scaleCode;
  final num integrationId;
  final num code;
  final num? sequence;
  final num? quantity;
  num? minQuantity;
  final num? variationValue;
  final num? variationPercentage;

  Scale({
    required this.scaleCode,
    required this.integrationId,
    required this.code,
    required this.sequence,
    required this.quantity,
    required this.variationValue,
    required this.variationPercentage,
    this.minQuantity,
  });
}
