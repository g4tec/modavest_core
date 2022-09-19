import 'package:modavest_core/data/models/average_period/average_period_hive.dart';
import 'package:modavest_core/domain/models/average_period.dart';

class AveragePeriodModel extends AveragePeriod {
  const AveragePeriodModel({
    required num priceTableCode,
    required num integrationId,
    required num sequence,
    required num? quantity,
    required num? state,
    required num? variationPercentage,
    required num? variationValue,
  }) : super(
          priceTableCode: priceTableCode,
          integrationId: integrationId,
          sequence: sequence,
          quantity: quantity,
          state: state,
          variationPercentage: variationPercentage,
          variationValue: variationValue,
        );

  factory AveragePeriodModel.fromJson(Map json) {
    return AveragePeriodModel(
      priceTableCode: json["priceTableCode"] as num,
      integrationId: json["integrationId"] as num,
      sequence: json["sequence"] as num,
      quantity: json["quantity"] as num?,
      state: json["state"] as num?,
      variationPercentage: json["variationPercentage"] as num?,
      variationValue: json["variationValue"] as num?,
    );
  }

  HiveAveragePeriod toHive() {
    return HiveAveragePeriod(
      priceTableCode: priceTableCode,
      integrationId: integrationId,
      sequence: sequence,
      quantity: quantity,
      state: state,
      variationPercentage: variationPercentage,
      variationValue: variationValue,
    );
  }

  factory AveragePeriodModel.fromHive(HiveAveragePeriod hiveAveragePeriod) {
    return AveragePeriodModel(
      priceTableCode: hiveAveragePeriod.priceTableCode,
      integrationId: hiveAveragePeriod.integrationId,
      sequence: hiveAveragePeriod.sequence,
      quantity: hiveAveragePeriod.quantity,
      state: hiveAveragePeriod.state,
      variationPercentage: hiveAveragePeriod.variationPercentage,
      variationValue: hiveAveragePeriod.variationValue,
    );
  }
}
