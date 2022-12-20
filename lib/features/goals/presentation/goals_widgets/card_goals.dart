import 'package:flutter/material.dart';
import 'package:modavest_core/features/goals/presentation/goals_widgets/card_goals_item.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/goal.dart';
import 'package:modavest_core/domain/models/goal_item.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  final String? searchString;
  final Widget profileAvatar;

  const GoalCard(
      {super.key,
      required this.goal,
      this.searchString,
      required this.profileAvatar});

  List<Widget> buildGoalItem(List<GoalItem> goalItems) {
    final List<Widget> goalItemCards = [];

    for (final goalItem in goalItems) {
      if (searchString != null) {
        if (goalItem.legalPersons.any(
          (legalPerson) =>
              legalPerson.cnpj
                  .toString()
                  .contains(searchString!.toLowerCase()) ||
              legalPerson.name
                  .toString()
                  .toLowerCase()
                  .contains(searchString!.toLowerCase()) ||
              legalPerson.fantasyName
                  .toString()
                  .toLowerCase()
                  .contains(searchString!.toLowerCase()),
        )) {
          goalItemCards.add(GoalItemCard(
            goalItem: goalItem,
            profileAvatar: profileAvatar,
          ));
        }
      } else {
        goalItemCards.add(
            GoalItemCard(goalItem: goalItem, profileAvatar: profileAvatar));
      }
    }
    return goalItemCards;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          "${ModaVestLabels.goal}: ${goal.description}",
          style: Theme.of(context).textTheme.headline5,
        ),
        children: buildGoalItem(goal.goalItems),
      ),
    );
  }
}
