import 'package:modavest_core/data/models/scale/scale_hive.dart';
import 'package:modavest_core/domain/models/scale.dart';

class ScaleModel extends Scale {
  ScaleModel({
    required num scaleCode,
    required num integrationId,
    required num code,
    required num? sequence,
    required num? quantity,
    required num? variationValue,
    required num? variationPercentage,
  }) : super(
          scaleCode: scaleCode,
          integrationId: integrationId,
          code: code,
          sequence: sequence,
          quantity: quantity,
          variationValue: variationValue,
          variationPercentage: variationPercentage,
        );

  factory ScaleModel.fromJson(Map json, num scaleCode) {
    return ScaleModel(
      scaleCode: scaleCode,
      integrationId: json["integrationId"] as num,
      code: json["code"] as num,
      sequence: json["sequence"] as num,
      quantity: json["quantity"] as num,
      variationValue: json["variationValue"] as num?,
      variationPercentage: json["variationPercentage"] as num?,
    );
  }

  factory ScaleModel.fromHive(HiveScale hiveScale) {
    return ScaleModel(
      scaleCode: hiveScale.scaleCode,
      integrationId: hiveScale.integrationId,
      code: hiveScale.code,
      sequence: hiveScale.sequence,
      quantity: hiveScale.quantity,
      variationValue: hiveScale.variationValue,
      variationPercentage: hiveScale.variationPercentage,
    );
  }

  HiveScale toHive() {
    return HiveScale(
      scaleCode: scaleCode,
      integrationId: integrationId,
      code: code,
      sequence: sequence,
      quantity: quantity,
      variationValue: variationValue,
      variationPercentage: variationPercentage,
    );
  }
}
