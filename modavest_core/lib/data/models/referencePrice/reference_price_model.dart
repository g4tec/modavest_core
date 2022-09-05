import 'package:modavest_core/data/models/productPrice/product_price_hive.dart';
import 'package:modavest_core/data/models/productPrice/product_price_model.dart';
import 'package:modavest_core/data/models/referencePrice/reference_price_hive.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/reference_price.dart';

class ReferencePriceModel extends ReferencePrice {
  ReferencePriceModel({
    required String? referenceCode,
    required num? min,
    required List<ProductPrice>? prices,
    required num priceTableCode,
  }) : super(
          referenceCode: referenceCode,
          min: min,
          prices: prices,
          priceTableCode: priceTableCode,
        );
  factory ReferencePriceModel.fromJson(
    Map json, {
    required num priceTableCode,
  }) {
    return ReferencePriceModel(
      referenceCode: json["referenceCode"] as String,
      min: json["referencePrice"] as num?,
      priceTableCode: priceTableCode,
      prices: ((json["prices"] as List?) ?? [])
          .map(
            (price) => ProductPriceModel.fromJson(
              price as Map,
              referenceCode: json["referenceCode"] as String,
            ),
          )
          .toList(),
    );
  }
  factory ReferencePriceModel.fromHive(HiveReferencePrice productPriceHive) {
    return ReferencePriceModel(
      referenceCode: productPriceHive.referenceCode,
      min: productPriceHive.min,
      prices: (productPriceHive.prices)
          ?.map((HiveProductPrice e) => ProductPriceModel.fromHive(e))
          .toList(),
      priceTableCode: productPriceHive.priceTableCode,
    );
  }

  HiveReferencePrice toHive() {
    return HiveReferencePrice(
      referenceCode: referenceCode,
      min: min,
      prices: null,
      priceTableCode: priceTableCode,
    );
  }
}
