import 'package:modavest_core/data/models/product_stock/product_stock_hive.dart';
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
      stock: json["stock"] != null
          ? json["stock"] > 0
              ? json["stock"]
              : 0
          : null,
    );
  }

  factory ProductStockModel.fromHive(HiveProductStock hiveProductStock) {
    return ProductStockModel(
      integrationId: hiveProductStock.integrationId,
      officialStoreId: hiveProductStock.officialStoreId,
      productCode: hiveProductStock.productCode,
      stock: hiveProductStock.stock,
    );
  }
  factory ProductStockModel.entity(ProductStock entity) {
    return ProductStockModel(
      integrationId: entity.integrationId,
      officialStoreId: entity.officialStoreId,
      productCode: entity.productCode,
      stock: entity.stock,
    );
  }

  HiveProductStock toHive() {
    return HiveProductStock(
      integrationId: integrationId,
      officialStoreId: officialStoreId,
      productCode: productCode,
      stock: stock,
    );
  }
}
