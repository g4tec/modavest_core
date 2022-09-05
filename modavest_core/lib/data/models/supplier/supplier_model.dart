import 'package:modavest_core/domain/models/supplier.dart';

class SupplierModel extends Supplier {
  const SupplierModel({
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

  factory SupplierModel.fromJson(Map json) {
    return SupplierModel(
      id: json["supplierId"] as int,
      code: json["supplierCode"] as int?,
      cpfCnpj: json["supplierCpfCnpj"] as String?,
      name: json["supplierName"] as String?,
    );
  }
}
