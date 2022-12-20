import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:modavest_core/features/goals/presentation/goals_widgets/card_progress.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/domain/models/goal_item.dart';
import 'package:modavest_core/utils/format_date.dart';
import 'package:modavest_core/utils/format_money.dart';
import 'package:modavest_core/utils/safe_division.dart';

class GoalItemCard extends StatelessWidget {
  final GoalItem goalItem;
  final Widget profileAvatar;
  const GoalItemCard({
    super.key,
    required this.goalItem,
    required this.profileAvatar,
  });

  Widget buildProgress({
    required num percentage,
    double width = 30,
    TextStyle? titleStyle,
  }) {
    late String reachedString;
    late String goalString;
    if (goalItem.goalValue != null) {
      goalString = toCurrency(goalItem.goalValue!.toDouble());
      reachedString = toCurrency(goalItem.reachedValue?.toDouble() ?? 0);
    } else {
      goalString = "${goalItem.goalQuantity.toString()} pedidos";
      reachedString = "${goalItem.reachedQuantity.toString()} pedidos";
    }

    final String percentageString =
        intl.NumberFormat.percentPattern().format(percentage);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: width * 0.2,
          width: width * 0.2,
          child: profileAvatar,
        ),
        SizedBox(
          width: width * 0.8,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ModaVestLabels.reached,
                    style: titleStyle,
                  ),
                  Text("$reachedString($percentageString)  > "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ModaVestLabels.goal,
                    style: titleStyle,
                  ),
                  Text(goalString),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTerm({TextStyle? titleStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, bottom: 4),
                  child: Icon(Icons.emoji_events),
                ),
                Text(
                  ModaVestLabels.term,
                  style: titleStyle,
                )
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(formatDate(goalItem.initialDate)),
                const Text(" a "),
                Text(formatDate(goalItem.finalDate)),
              ],
            ),
          ],
        ),
        const Icon(Icons.expand_less),
      ],
    );
  }

  Widget buildSpecification({
    double size = 10,
    required String title,
    required List<String> values,
    TextStyle? titleStyle,
  }) {
    return SizedBox(
      width: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          ...values.map((e) => Text(e)).toList(),
        ],
      ),
    );
  }

  Widget buildSpecifications(double cellSize, TextStyle? titleStyle) {
    final String goalTypeString = goalTypes[goalItem.goalType] ?? "-";
    final String statesString = goalItem.ufs.join(" | ");

    return Wrap(
      runSpacing: 10,
      children: [
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.typeGoal,
          values: [goalTypeString],
        ),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.uf,
          values: [statesString],
        ),
        ...() {
          final List<String> storesNames =
              goalItem.officialStores.map((e) => e.description).toList();

          if (storesNames.length > 1) {
            return [
              buildSpecification(
                titleStyle: titleStyle,
                size: cellSize,
                title: ModaVestLabels.officialStores,
                values: storesNames.sublist(
                  (storesNames.length / 2).truncate(),
                  storesNames.length,
                ),
              ),
              buildSpecification(
                titleStyle: titleStyle,
                size: cellSize,
                title: ModaVestLabels.officialStores,
                values: storesNames.sublist(
                  0,
                  (storesNames.length / 2).truncate(),
                ),
              ),
            ];
          }
          return [
            buildSpecification(
              titleStyle: titleStyle,
              size: cellSize,
              title: ModaVestLabels.officialStores,
              values: storesNames,
            ),
          ];
        }.call(),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.colection,
          values: goalItem.colections,
        ),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.storekepper,
          values: goalItem.legalPersons
              .map((e) => e.name ?? e.fantasyName ?? e.nameMainRelated ?? "")
              .toList(),
        ),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.typeClassificationProduct,
          values: goalItem.productClassifications
              .map(
                (e) =>
                    "${e.typeName ?? e.typeNameAux ?? e.typeCode ?? ""}/${e.name ?? e.nameAux ?? e.code ?? ""}",
              )
              .toList(),
        ),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.typeClassificationOrder,
          values: goalItem.orderClassifications
              .map(
                (e) =>
                    "${e.typeName ?? e.typeNameAux ?? e.typeCode ?? ""}/${e.name ?? e.nameAux ?? e.code ?? ""}",
              )
              .toList(),
        ),
        buildSpecification(
          titleStyle: titleStyle,
          size: cellSize,
          title: ModaVestLabels.reference,
          values: goalItem.references,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    num progressPercentage = 0;
    if (goalItem.goalValue != null && goalItem.reachedValue != null) {
      progressPercentage = safeDivision(
        goalItem.reachedValue!.toDouble(),
        goalItem.goalValue!.toDouble(),
      );
    } else if (goalItem.goalQuantity != null &&
        goalItem.reachedQuantity != null) {
      progressPercentage = safeDivision(
        goalItem.reachedQuantity!.toDouble(),
        goalItem.goalQuantity!.toDouble(),
      );
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ConfigurableExpansionTile(
        headerExpanded: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              buildTerm(
                titleStyle: Theme.of(context).textTheme.headline5,
              ),
              ProgressCard(value: progressPercentage),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: buildProgress(
                  percentage: progressPercentage,
                  width: MediaQuery.of(context).size.width * 0.7,
                  titleStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
              buildSpecifications(
                MediaQuery.of(context).size.width * 0.7 / 2,
                Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        header: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: FittedBox(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ProgressCard(value: progressPercentage),
                ),
                const Icon(Icons.expand_more),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
