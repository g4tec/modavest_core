import 'package:modavest_core/domain/models/shipping_company.dart';

class ShippingCompanyModel extends ShippingCompany {
  ShippingCompanyModel({
    super.code,
    super.name,
  });

  factory ShippingCompanyModel.fromJson(Map<String, dynamic> json) {
    return ShippingCompanyModel(
      code: json['shippingCompanyCode'] as int?,
      name: json['shippingCompanyName'] as String?,
    );
  }
}
