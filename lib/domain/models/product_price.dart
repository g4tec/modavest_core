import 'package:equatable/equatable.dart';

class ProductPrice extends Equatable {
  final num? productCode;
  final num? originalPrice;
  final num? branchCode;
  final num? price;
  final num? scaleCode;
  final String referenceCode;

  const ProductPrice({
    required this.productCode,
    required this.originalPrice,
    required this.branchCode,
    required this.price,
    required this.referenceCode,
    required this.scaleCode,
  });

  factory ProductPrice.copyWith(ProductPrice productPrice, {double? price}) {
    return ProductPrice(
      productCode: productPrice.productCode,
      originalPrice: productPrice.originalPrice,
      branchCode: productPrice.branchCode,
      price: price ?? productPrice.price,
      referenceCode: productPrice.referenceCode,
      scaleCode: productPrice.scaleCode,
    );
  }

  @override
  List<Object?> get props =>
      [productCode, originalPrice, branchCode, price, referenceCode, scaleCode];
}
