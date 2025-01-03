import 'package:modavest_core/domain/models/reference_price.dart';

class ReferenceSimple {
  final String code;
  final int integrationId;
  final String? description;
  final num? officialStoreCode;
  final num? priceTableCode;

  final String? name;
  final String? imageColorReference;
  num? priceTable;

  ReferencePrice? referencePrice;
  num? oficialStore;
  final String? base64;

  ReferenceSimple({
    required this.code,
    required this.integrationId,
    required this.oficialStore,
    required this.priceTable,
    this.description,
    this.name,
    this.imageColorReference,
    required this.referencePrice,
    this.officialStoreCode,
    this.priceTableCode,
    this.base64,
  });

  bool filter(String string) {
    return (name ?? "").toLowerCase().contains(string.toLowerCase()) ||
        (description ?? "").toLowerCase().contains(string.toLowerCase()) ||
        code.toLowerCase().contains(string.toLowerCase());
  }
}
