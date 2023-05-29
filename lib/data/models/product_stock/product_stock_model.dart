import 'package:modavest_core/domain/models/product_stock.dart';

class ProductStockModel extends ProductStock {
  const ProductStockModel({
    required super.integrationId,
    required super.officialStoreId,
    required super.productCode,
    required super.stock,
  });

  factory ProductStockModel.fromJson(json) {
    return ProductStockModel(
      integrationId: json["integrationId"],
      officialStoreId: json["officialStoreId"],
      productCode: json["productCode"],
      stock: json["stock"],
    );
  }
}
