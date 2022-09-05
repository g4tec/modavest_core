import 'package:modavest_core/domain/models/product_price.dart';

class ProductPriceModel extends ProductPrice {
  const ProductPriceModel({
    num? productCode,
    num? originalPrice,
    num? branchCode,
    num? price,
    num? scaleCode,
    required String referenceCode,
  }) : super(
          productCode: productCode,
          originalPrice: originalPrice,
          branchCode: branchCode,
          price: price,
          referenceCode: referenceCode,
          scaleCode: scaleCode,
        );
  factory ProductPriceModel.fromJson(
    Map json, {
    required String referenceCode,
  }) {
    return ProductPriceModel(
      referenceCode: referenceCode,
      originalPrice: json["originalPrice"] as num?,
      branchCode: json["branchCode"] as num?,
      productCode: json["productCode"] as num?,
      price: json["price"] as num?,
      scaleCode: json["scaleCode"] as num?,
    );
  }
}
