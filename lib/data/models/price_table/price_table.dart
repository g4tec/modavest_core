import 'package:modavest_core/data/models/average_period/average_period_model.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_model.dart';
import 'package:modavest_core/data/models/price_table/price_table_hive.dart';
import 'package:modavest_core/domain/models/price_table.dart';

class PriceTableModel extends PriceTable {
  const PriceTableModel({
    required int? officialStoreId,
    required int integrationId,
    required int priceTableCode,
    String? stateCode,
    String? state,
    String? description,
    required List<AveragePeriodModel>? averagePeriod,
    required List<PaymentConditionsModel>? paymentConditions,
  }) : super(
          officialStoreId: officialStoreId,
          integrationId: integrationId,
          priceTableCode: priceTableCode,
          stateCode: stateCode,
          state: state,
          description: description,
          averagePeriod: averagePeriod,
          paymentConditions: paymentConditions,
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
    );
  }

  factory PriceTableModel.fromOfficialStoreJson(
    Map json,
    num officialStoreId,
    num integrationId,
  ) {
    return PriceTableModel(
      officialStoreId: officialStoreId.toInt(),
      integrationId: integrationId.toInt(),
      priceTableCode: json['priceTableCode'] as int,
      description: json['description'] as String,
      averagePeriod: (json["averagePeriod"] as List? ?? [])
          .map((e) => AveragePeriodModel.fromJson(e as Map))
          .toList(),
      paymentConditions: (json["paymentConditions"] as List? ?? [])
          .map((e) => PaymentConditionsModel.fromJson(e as Map))
          .toList(),
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
