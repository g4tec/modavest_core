import 'package:modavest_core/data/models/productPrice/product_price_hive.dart';
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

  factory ProductPriceModel.fromHive(HiveProductPrice productPriceHive) {
    return ProductPriceModel(
      referenceCode: productPriceHive.referenceCode,
      originalPrice: productPriceHive.originalPrice,
      branchCode: productPriceHive.branchCode,
      productCode: productPriceHive.productCode,
      price: productPriceHive.price,
      scaleCode: productPriceHive.scaleCode,
    );
  }

  factory ProductPriceModel.entity(ProductPrice productPrice) {
    return ProductPriceModel(
      referenceCode: productPrice.referenceCode,
      originalPrice: productPrice.originalPrice,
      branchCode: productPrice.branchCode,
      productCode: productPrice.productCode,
      price: productPrice.price,
      scaleCode: productPrice.scaleCode,
    );
  }

  HiveProductPrice toHive() {
    return HiveProductPrice(
      referenceCode: referenceCode,
      originalPrice: originalPrice,
      branchCode: branchCode,
      productCode: productCode,
      price: price,
      scaleCode: scaleCode,
    );
  }
}
