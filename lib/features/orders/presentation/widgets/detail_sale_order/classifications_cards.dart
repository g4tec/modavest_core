import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/official_store_sales_questions.dart';
import 'package:modavest_core/domain/models/options.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

class ClassificationsCard extends StatelessWidget {
  final SalesOrder salesOrder;
  const ClassificationsCard({
    super.key,
    required this.salesOrder,
  });

  Widget buildRow({
    required String title,
    required String title2,
    required BuildContext context,
    bool filled = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: filled ? Colors.grey.shade300 : Colors.white30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: AutoSizeText(
              title2,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (salesOrder.classifications ?? []).isEmpty
        ? const Center(child: Text("Não há claassificações para esse pedido"))
        : ListView(children: [
            ...(salesOrder.classifications ?? [])
                .asMap()
                .map(
                  (
                    index,
                    e,
                  ) {
                    return MapEntry(
                        index,
                        buildRow(
                          title: "Tipo Class/Class",
                          title2: e.typeName != null && e.name != null
                              ? "${e.typeName}(${e.typeCode}) / ${e.name}(${e.code})"
                              : "${e.typeCode} / ${e.code}",
                          context: context,
                          filled: index % 2 == 0,
                        ));
                  },
                )
                .values
                .toList(),
            ...buidlClassificationsByOfficialStoreQuestions(
                salesOrder.officialStoreSalesQuestions ?? [], context)
          ]);
  }

  List<Widget> buidlClassificationsByOfficialStoreQuestions(
      List<OfficialStoreSalesQuestions> questions, BuildContext context) {
    final List<Classification> classifications = [];

    for (final question in questions) {
      switch (question.questionType) {
        case 'LISTA DE SELEÇÃO':
          final Options? option = question.options
              .firstWhereOrNull((element) => element.code == question.answer);
          if (option != null) {
            if (option.typeCode != null && option.code != null) {
              classifications.add(Classification(
                  id: 0,
                  code: option.typeCode?.toString(),
                  typeCode: int.tryParse(option.code ?? "")));
            }
          }

          break;

        case 'CAIXA DE SELEÇÃO':
          final List<Options> options = question.options
              .where((element) =>
                  (question.answer as List<String>).contains(element.code))
              .toList();

          for (final Options option in options) {
            classifications.add(Classification(
                id: 0,
                typeName: option.definedFieldType,
                name: option.definedFieldValue,
                code: option.typeCode?.toString(),
                typeCode: int.tryParse(option.code ?? "")));
          }
          break;
      }
    }

    return classifications
        .asMap()
        .map(
          (
            index,
            e,
          ) {
            return MapEntry(
                index,
                buildRow(
                  title: "Tipo Class/Class",
                  title2: e.typeName != null && e.name != null
                      ? "${e.typeName}(${e.typeCode}) / ${e.name}(${e.code})"
                      : "${e.typeCode} / ${e.code}",
                  context: context,
                  filled: index % 2 == 0,
                ));
          },
        )
        .values
        .toList();
  }
}
