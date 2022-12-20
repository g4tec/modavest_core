import 'package:modavest_core/domain/models/goal_item.dart';

class Goal {
  final num code;
  final num integrationId;
  final String description;
  final List<GoalItem> goalItems;

  Goal({
    required this.code,
    required this.integrationId,
    required this.description,
    required this.goalItems,
  });
}
