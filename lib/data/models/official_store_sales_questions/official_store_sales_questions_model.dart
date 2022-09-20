import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/data/models/official_store_sales_questions/official_store_sales_questions_hive.dart';
import 'package:modavest_core/data/models/options/options_hive.dart';
import 'package:modavest_core/data/models/options/options_model.dart';
import 'package:modavest_core/domain/models/official_store_sales_questions.dart';

class OfficialStoreSalesQuestionsModel extends OfficialStoreSalesQuestions {
  OfficialStoreSalesQuestionsModel({
    required super.integrationId,
    required super.officialStoreId,
    required super.questionId,
    required super.description,
    required super.questionType,
    required super.isDeliverImmediately,
    required super.isMakeToOrder,
    required super.classifications,
    required List<OptionsModel> super.options,
    required super.observations,
    required super.isRequired,
    required super.isRepresentativeApp,
    required super.isSellerApp,
    required super.isShopkeeperApp,
  });

  factory OfficialStoreSalesQuestionsModel.fromJson(Map json) {
    return OfficialStoreSalesQuestionsModel(
      integrationId: json['integrationId'] as num,
      officialStoreId: json['officialStoreId'] as num,
      questionId: json['questionId'] as num,
      description: json['description'] as String,
      questionType: json['questionType'] as String,
      isDeliverImmediately: json['isDeliverImmediately'] as bool,
      isMakeToOrder: json['isMakeToOrder'] as bool,
      isRequired: json['isRequired'] as bool,
      classifications: ((json['classifications'] as List?) ?? [])
          .map((e) => ClassificationModel.fromJson(e as Map,
              subCategoryId: "questionId:${json['questionId'].toString()}"))
          .toList(),
      observations: ((json['observations'] as List?) ?? [])
          .map((e) => (e as Map)["observation"] as String)
          .toList(),
      options: ((json['options'] as List?) ?? [])
          .map((e) => OptionsModel.fromJson(e as Map))
          .toList(),
      isRepresentativeApp: json['isRepresentativeApp'] as bool?,
      isSellerApp: json['isSellerApp'] as bool?,
      isShopkeeperApp: json['isShopkeeperApp'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['integrationId'] = integrationId;
    data['officialStoreId'] = officialStoreId;
    data['questionId'] = questionId;
    data['description'] = description;
    data['questionType'] = questionType;
    data['isDeliverImmediately'] = isDeliverImmediately;
    data['isMakeToOrder'] = isMakeToOrder;
    return data;
  }

  factory OfficialStoreSalesQuestionsModel.fromHive(
    HiveOfficialStoreSalesQuestions hiveOfficialStoreSalesQuestions,
  ) {
    return OfficialStoreSalesQuestionsModel(
      integrationId: hiveOfficialStoreSalesQuestions.integrationId,
      officialStoreId: hiveOfficialStoreSalesQuestions.officialStoreId,
      questionId: hiveOfficialStoreSalesQuestions.questionId,
      description: hiveOfficialStoreSalesQuestions.description,
      questionType: hiveOfficialStoreSalesQuestions.questionType,
      isDeliverImmediately:
          hiveOfficialStoreSalesQuestions.isDeliverImmediately,
      isMakeToOrder: hiveOfficialStoreSalesQuestions.isMakeToOrder,
      isRequired: hiveOfficialStoreSalesQuestions.isRequired,
      classifications: [],
      options: (hiveOfficialStoreSalesQuestions.options ?? [])
          .map((hiveOption) => OptionsModel.fromHive(hiveOption as HiveOptions))
          .toList(),
      observations: [],
      isRepresentativeApp: hiveOfficialStoreSalesQuestions.isRepresentativeApp,
      isSellerApp: hiveOfficialStoreSalesQuestions.isSellerApp,
      isShopkeeperApp: hiveOfficialStoreSalesQuestions.isShopkeeperApp,
    );
  }

  HiveOfficialStoreSalesQuestions toHive() {
    return HiveOfficialStoreSalesQuestions(
      integrationId: integrationId,
      officialStoreId: officialStoreId,
      questionId: questionId,
      description: description,
      questionType: questionType,
      isDeliverImmediately: isDeliverImmediately,
      isMakeToOrder: isMakeToOrder,
      isRequired: isRequired,
      isRepresentativeApp: isRepresentativeApp,
      isSellerApp: isSellerApp,
      isShopkeeperApp: isShopkeeperApp,
    );
  }
}
