import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/data/models/legal_person/legal_person_model.dart';
import 'package:modavest_core/data/models/oficial_store/oficial_store_model.dart';
import 'package:modavest_core/domain/models/goal_item.dart';

class GoalItemModel extends GoalItem {
  GoalItemModel(
      {required super.goalCode,
      required super.goalType,
      required super.initialDate,
      required super.finalDate,
      required List<OficialStoreModel> super.officialStores,
      required super.colections,
      required super.ufs,
      required List<LegalPersonModel> super.legalPersons,
      required List<ClassificationModel> super.productClassifications,
      required List<ClassificationModel> super.orderClassifications,
      required super.references,
      super.goalValue,
      super.reachedValue,
      super.goalQuantity,
      super.reachedQuantity,
      super.description});

  factory GoalItemModel.fromJson(Map<String, dynamic> json) => GoalItemModel(
        goalCode: json["goalId"] as num,
        goalType: json["goalType"] as num,
        initialDate: DateTime.parse(json["initialDate"] as String),
        finalDate: DateTime.parse(json["finalDate"] as String),
        officialStores: (json["officialStores"] as List)
            .map((x) => OficialStoreModel.fromJson(x as Map))
            .toList(),
        colections: (json["collections"] as List? ?? [])
            .map((x) => (x as Map)["description"].toString())
            .toList(),
        ufs: (json["ufs"] as List).map((x) => x as String).toList(),
        legalPersons: (json["legalPersons"] as List? ?? [])
            .map((x) => LegalPersonModel.fromJson(x as Map))
            .toList(),
        orderClassifications: (json["orderClassifications"] as List? ?? [])
            .map((x) => ClassificationModel.fromJson(x as Map))
            .toList(),
        productClassifications: (json["productClassifications"] as List? ?? [])
            .map((x) => ClassificationModel.fromJson(x as Map))
            .toList(),
        references: (json["references"] as List? ?? [])
            .map((x) => x as String)
            .toList(),
        goalValue: json["goalValue"] as num?,
        reachedValue: json["reachedValue"] as num?,
        goalQuantity: json["goalQuantity"] as num?,
        reachedQuantity: json["reachedQuantity"] as num?,
        description: json["description"] as String?,
      );
}
