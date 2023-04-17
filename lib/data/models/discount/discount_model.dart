import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/domain/models/discount.dart';

class DiscountModel extends Discount {
  const DiscountModel({super.code, super.percentage, super.value});

  factory DiscountModel.fromJson(Map json) {
    return DiscountModel(
      code: json["code"] as num?,
      percentage: json["percentage"] as num?,
      value: json["value"] as num?,
    );
  }

  factory DiscountModel.fromHive(HiveDiscount discountHive) {
    return DiscountModel(
      code: discountHive.code,
      percentage: discountHive.percentage,
    );
  }

  HiveDiscount toHive() {
    return HiveDiscount(
      code: code ?? 0,
      percentage: percentage ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "typeDiscountCode": code,
      "discountPercentage": percentage,
      "value": value,
    };
  }

  factory DiscountModel.fromEntitie(Discount discount) {
    return DiscountModel(
      code: discount.code,
      percentage: discount.percentage,
    );
  }
}
