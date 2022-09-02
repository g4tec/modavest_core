import 'package:modavest_core/data/models/price_table_scales/price_table_scales_hive.dart';
import 'package:modavest_core/data/models/scale/scale_hive.dart';
import 'package:modavest_core/data/models/scale/scale_model.dart';
import 'package:modavest_core/domain/models/price_table_scales.dart';
import 'package:modavest_core/domain/models/scale.dart';

class PriceTableScalesModel extends PriceTableScales {
  const PriceTableScalesModel({
    required num scaleCode,
    required num integrationId,
    required num headerCode,
    required String? scaleDescription,
    required List<Scale> scales,
    required num priceTableCode,
    required String param,
  }) : super(
          scaleCode: scaleCode,
          integrationId: integrationId,
          headerCode: headerCode,
          scaleDescription: scaleDescription,
          scales: scales,
          priceTableCode: priceTableCode,
          param: param,
        );

  factory PriceTableScalesModel.fromJson(Map json, String param) {
    return PriceTableScalesModel(
      scaleCode: json["scaleCode"] as num,
      integrationId: json["integrationId"] as num,
      headerCode: json["headerCode"] as num,
      scaleDescription: json["scaleDescription"] as String,
      scales: ((json["scales"] as List?) ?? [])
          .map((e) => ScaleModel.fromJson(e as Map, json["scaleCode"] as num))
          .toList(),
      priceTableCode: json["headerCode"] as num,
      param: param,
    );
  }

  factory PriceTableScalesModel.fromHive(
    HivePriceTableScales hivePriceTableScales,
  ) {
    return PriceTableScalesModel(
      scaleCode: hivePriceTableScales.scaleCode,
      integrationId: hivePriceTableScales.integrationId,
      headerCode: hivePriceTableScales.headerCode,
      scaleDescription: hivePriceTableScales.scaleDescription,
      scales: (hivePriceTableScales.scales ?? [])
          .map((e) => ScaleModel.fromHive(e as HiveScale))
          .toList(),
      priceTableCode: hivePriceTableScales.priceTableCode,
      param: hivePriceTableScales.param,
    );
  }

  HivePriceTableScales toHive() {
    return HivePriceTableScales(
      scaleCode: scaleCode,
      integrationId: integrationId,
      headerCode: headerCode,
      scaleDescription: scaleDescription,
      priceTableCode: priceTableCode,
      scales: null,
      param: param,
    );
  }
}
