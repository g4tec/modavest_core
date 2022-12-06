import 'package:modavest_core/domain/models/official_store_installment.dart';

class OfficialStoreInstallmentModel extends OfficialStoreInstallment {
  OfficialStoreInstallmentModel({
    required super.instalment,
    required super.integrationId,
    required super.officialStoreId,
    required super.feesShopkeeper,
    required super.feesManufaturer,
  });

  factory OfficialStoreInstallmentModel.fromJson(Map<String, dynamic> json) {
    return OfficialStoreInstallmentModel(
      instalment: json["installment"] as num,
      integrationId: json["integrationId"] as num,
      officialStoreId: json["officialStoreId"] as num,
      feesShopkeeper: json["feesShopkeeper"] != null
          ? json["feesShopkeeper"] is int
              ? json["feesShopkeeper"] >= 1
              : json["feesShopkeeper"] as bool
          : false,
      feesManufaturer: json["feesManufaturer"] != null
          ? json["feesManufaturer"] is int
              ? json["feesManufaturer"] >= 1
              : json["feesManufaturer"] as bool
          : false,
    );
  }
}
