import 'package:modavest_core/domain/models/product_manufacturer.dart';

class ProductManufacturerModel extends ProductManufacturer {
  const ProductManufacturerModel({
    required int id,
    int? code,
    String? cpfCnpj,
    String? name,
  }) : super(
          id: id,
          code: code,
          cpfCnpj: cpfCnpj,
          name: name,
        );

  factory ProductManufacturerModel.fromJson(Map json) {
    return ProductManufacturerModel(
      id: json["productManufacturerId"] as int,
      code: json["productManufacturerCode"] as int,
      cpfCnpj: json["productManufacturerCpfCnpj"].toString(),
      name: json["productManufacturerName"].toString(),
    );
  }
}
