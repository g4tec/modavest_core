import 'package:modavest_core/domain/models/product_price.dart';

class ReferencePrice {
  final String? referenceCode;
  final num? min;
  final List<ProductPrice>? prices;
  final num priceTableCode;

  const ReferencePrice({
    required this.referenceCode,
    required this.min,
    required this.prices,
    required this.priceTableCode,
  });
}
