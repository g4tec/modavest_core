import 'package:modavest_core/data/models/goal/goal_item_model.dart';
import 'package:modavest_core/domain/models/goal.dart';

class GoalModel extends Goal {
  GoalModel({
    required super.code,
    required super.integrationId,
    required super.description,
    required List<GoalItemModel> super.goalItems,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        code: json["goalId"] as num,
        integrationId: json["integrationId"] as num,
        description: json["description"] as String,
        goalItems: (json["items"] as List? ?? [])
            .map((x) => GoalItemModel.fromJson(x as Map<String, dynamic>))
            .toList(),
      );
}
