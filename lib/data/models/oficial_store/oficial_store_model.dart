import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/data/models/discount/discount_model.dart';
import 'package:modavest_core/data/models/official_store_installment/official_store_installment_model.dart';
import 'package:modavest_core/data/models/oficial_store/oficial_store_hive.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_hive.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_model.dart';
import 'package:modavest_core/data/models/price_table/price_table.dart';
import 'package:modavest_core/data/models/price_table/price_table_hive.dart';
import 'package:modavest_core/domain/models/official_store.dart';

class OficialStoreModel extends OficialStore {
  const OficialStoreModel({
    required num integrationId,
    required num officialStoreId,
    required String description,
    required bool isDeliveryImmediately,
    required bool isMakeToOrder,
    required bool isVisibleCustomer,
    required bool isVisibleRepresentative,
    required bool isVisibleSeller,
    required num? minimumCifValue,
    required String? logoUrl,
    required String? createdAt,
    required String? updatedAt,
    required List<PriceTableModel> priceTables,
    required List<DiscountModel> discount,
    required List<PaymentConditionsModel> paymentConditions,
    OfficialStoreInstallmentModel? installment,
  }) : super(
          integrationId: integrationId,
          officialStoreId: officialStoreId,
          description: description,
          isDeliveryImmediately: isDeliveryImmediately,
          isMakeToOrder: isMakeToOrder,
          isVisibleCustomer: isVisibleCustomer,
          isVisibleRepresentative: isVisibleRepresentative,
          isVisibleSeller: isVisibleSeller,
          minimumCifValue: minimumCifValue,
          logoUrl: logoUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
          priceTables: priceTables,
          discount: discount,
          paymentConditions: paymentConditions,
          installment: installment,
        );

  factory OficialStoreModel.fromJson(Map json) {
    return OficialStoreModel(
      integrationId: json['integrationId'] as num,
      officialStoreId: json['officialStoreId'] as num,
      description: json['description'] as String,
      isDeliveryImmediately: json['isDeliveryImmediately'] as bool,
      isMakeToOrder: json['isMakeToOrder'] as bool,
      isVisibleCustomer: json['isVisibleCustomer'] as bool,
      isVisibleRepresentative: json['isVisibleRepresentative'] as bool,
      isVisibleSeller: json['isVisibleSeller'] as bool,
      minimumCifValue: json['minimumCifValue'] as num?,
      logoUrl: json['logoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      priceTables: ((json['priceTables'] ?? []) as List)
          .map(
            (e) => PriceTableModel.fromOfficialStoreJson(
              e as Map,
              json['officialStoreId'] as num,
              json['integrationId'] as num,
              averagePeriod: json['averagePeriod'],
            ),
          )
          .toList(),
      discount: ((json['discounts'] as List?) ?? [])
          .map((dynamic e) => DiscountModel.fromJson(e as Map))
          .toList(),
      paymentConditions: ((json['paymentConditions'] as List?) ?? [])
          .map(
            (dynamic e) => PaymentConditionsModel.fromJson(
              e as Map,
              officialStore: json['officialStoreId'] as num,
            ),
          )
          .toList(),
      installment: json["installment"] != null
          ? OfficialStoreInstallmentModel.fromJson(json["installment"])
          : null,
    );
  }
  HiveOficialStore toHive() {
    return HiveOficialStore(
      integrationId: integrationId,
      officialStoreId: officialStoreId,
      description: description,
      isDeliveryImmediately: isDeliveryImmediately,
      isMakeToOrder: isMakeToOrder,
      isVisibleCustomer: isVisibleCustomer,
      isVisibleRepresentative: isVisibleRepresentative,
      isVisibleSeller: isVisibleSeller,
      minimumCifValue: minimumCifValue,
      logoUrl: logoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory OficialStoreModel.fromHive(HiveOficialStore hiveOficialStore) {
    return OficialStoreModel(
      integrationId: hiveOficialStore.integrationId,
      officialStoreId: hiveOficialStore.officialStoreId,
      description: hiveOficialStore.description,
      isDeliveryImmediately: hiveOficialStore.isDeliveryImmediately,
      isMakeToOrder: hiveOficialStore.isMakeToOrder,
      isVisibleCustomer: hiveOficialStore.isVisibleCustomer,
      isVisibleRepresentative: hiveOficialStore.isVisibleRepresentative,
      isVisibleSeller: hiveOficialStore.isVisibleSeller,
      minimumCifValue: hiveOficialStore.minimumCifValue,
      logoUrl: hiveOficialStore.logoUrl,
      createdAt: hiveOficialStore.createdAt,
      updatedAt: hiveOficialStore.updatedAt,
      priceTables: hiveOficialStore.priceTables
          .map((HivePriceTable e) => PriceTableModel.fromHive(e))
          .toList(),
      discount: hiveOficialStore.discount
          .map((HiveDiscount e) => DiscountModel.fromHive(e))
          .toList(),
      paymentConditions: hiveOficialStore.paymentConditions
          .map((HivePaymentConditions e) => PaymentConditionsModel.fromHive(e))
          .toList(),
    );
  }
}
