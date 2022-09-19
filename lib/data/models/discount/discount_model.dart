import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/domain/models/discount.dart';

class DiscountModel extends Discount {
  const DiscountModel({
    required num code,
    required num percentage,
  }) : super(
          code: code,
          percentage: percentage,
        );

  factory DiscountModel.fromJson(Map json) {
    return DiscountModel(
      code: json["code"] as num,
      percentage: json["percentage"] as num,
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
      code: code,
      percentage: percentage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "typeDiscountCode": code,
      "discountPercentage": percentage,
    };
  }

  factory DiscountModel.fromEntitie(Discount discount) {
    return DiscountModel(
      code: discount.code,
      percentage: discount.percentage,
    );
  }
}
