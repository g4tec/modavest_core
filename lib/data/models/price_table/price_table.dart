import 'package:modavest_core/data/models/average_period/average_period_model.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_model.dart';
import 'package:modavest_core/data/models/price_table/price_table_hive.dart';
import 'package:modavest_core/data/models/price_table_scales/price_table_scales_model.dart';
import 'package:modavest_core/domain/models/average_period.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/price_table.dart';
import 'package:modavest_core/domain/models/price_table_scales.dart';

class PriceTableModel extends PriceTable {
  const PriceTableModel({
    required int? officialStoreId,
    required int integrationId,
    required int priceTableCode,
    String? stateCode,
    String? state,
    String? description,
    required List<AveragePeriod>? averagePeriod,
    required List<PaymentConditions>? paymentConditions,
    List<PriceTableScales>? scales,
  }) : super(
          officialStoreId: officialStoreId,
          integrationId: integrationId,
          priceTableCode: priceTableCode,
          stateCode: stateCode,
          state: state,
          description: description,
          averagePeriod: averagePeriod,
          paymentConditions: paymentConditions,
          scales: scales,
        );

  factory PriceTableModel.fromJson(Map json) {
    return PriceTableModel(
      officialStoreId: json['officialStoreId'] as int?,
      integrationId: json['integrationId'] as int,
      priceTableCode: json['priceTableCode'] as int? ?? json['code'] as int,
      stateCode: json['stateCode'] as String?,
      state: json['state'] as String?,
      description: json['description'] as String,
      averagePeriod: (json["averagePeriod"] as List? ?? [])
          .map((e) => AveragePeriodModel.fromJson(e as Map))
          .toList(),
      paymentConditions: (json["paymentConditions"] as List? ?? [])
          .map((e) => PaymentConditionsModel.fromJson(e as Map))
          .toList(),
      scales: (json['priceTableScale'] as List? ?? [])
          .map((e) => PriceTableScalesModel.fromJson(e as Map, '1'))
          .toList(),
    );
  }

  factory PriceTableModel.fromOfficialStoreJson(
    Map json,
    num officialStoreId,
    num integrationId, {
    MapEntry? averagePeriod,
  }) {
    PriceTableModel? priceTableAux;
    if (json["priceTable"] != null) {
      if (json["priceTable"] is Map) {
        priceTableAux = PriceTableModel.fromJson(json['priceTable'] as Map);
      }
    }
    return PriceTableModel(
      officialStoreId: officialStoreId.toInt(),
      integrationId: integrationId.toInt(),
      priceTableCode: json['priceTableCode'] as int,
      description: json['description'] as String,
      averagePeriod: priceTableAux?.averagePeriod ??
          (json["averagePeriod"] as List? ?? [])
              .map((e) => AveragePeriodModel.fromJson(e as Map))
              .toList(),
      paymentConditions: priceTableAux?.paymentConditions ??
          (json["paymentConditions"] as List? ?? [])
              .map((e) => PaymentConditionsModel.fromJson(e as Map))
              .toList(),
      scales: priceTableAux?.scales,
    );
  }
  HivePriceTable toHive() {
    return HivePriceTable(
      officialStoreId: officialStoreId,
      integrationId: integrationId,
      priceTableCode: priceTableCode,
      stateCode: stateCode,
      state: state,
      description: description,
    );
  }

  factory PriceTableModel.fromHive(HivePriceTable hivePriceTable) {
    return PriceTableModel(
      officialStoreId: hivePriceTable.officialStoreId,
      integrationId: hivePriceTable.integrationId,
      priceTableCode: hivePriceTable.priceTableCode,
      stateCode: hivePriceTable.stateCode,
      state: hivePriceTable.state,
      description: hivePriceTable.description,
      averagePeriod: hivePriceTable.averagePeriod
          ?.map((e) => AveragePeriodModel.fromHive(e))
          .toList(),
      paymentConditions: hivePriceTable.paymentConditions
          ?.map((e) => PaymentConditionsModel.fromHive(e))
          .toList(),
    );
  }
}
