import 'dart:convert';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/official_store_sales_questions.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_date.dart';

class ObservationsCard extends StatelessWidget {
  final SalesOrder salesOrder;
  const ObservationsCard({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            title2,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (salesOrder.observations.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            child: Text(
              "Pedido",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ...(salesOrder.observations)
            .asMap()
            .map(
              (
                index,
                e,
              ) {
                return MapEntry(
                    index,
                    buildRow(
                      title: "Descrição",
                      title2: e?.observation ?? " - ",
                      context: context,
                      filled: index % 2 == 0,
                    ));
              },
            )
            .values
            .toList(),
        if (salesOrder.representativeObservations.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            child: Text(
              "Representante",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ...(salesOrder.representativeObservations)
            .asMap()
            .map(
              (
                index,
                e,
              ) {
                return MapEntry(
                    index,
                    buildRow(
                      title: "Descrição",
                      title2: e?.observation ?? " - ",
                      context: context,
                      filled: index % 2 == 0,
                    ));
              },
            )
            .values
            .toList(),
        ...(salesOrder.officialStoreSalesQuestions ?? [])
            .asMap()
            .map(
              (
                index,
                e,
              ) {
                return MapEntry(
                    index,
                    buildRow(
                      title: e.description,
                      title2: buildanswerObservation(e),
                      context: context,
                      filled: index % 2 == 0,
                    ));
              },
            )
            .values
            .toList(),
      ],
    );
  }

  String buildanswerObservation(OfficialStoreSalesQuestions question) {
    switch (question.questionType) {
      case 'TEXTO':
        return question.answer ?? " - ";

      case 'LISTA DE SELEÇÃO':
        final option = question.options.firstWhereOrNull(
            (option) => option.sequence.toString() == question.answer);
        if (option != null) {
          switch (option.definedFieldType) {
            case "DATE":
              return formatDate(DateTime.parse(option.definedFieldValue!));

            case "INTEGER":
              return option.definedFieldValue!;

            default:
              return option.observation ?? option.option;
          }
        }
        return "-";
      case 'CAIXA DE SELEÇÃO':
        final options = question.options.where((option) =>
            List<int>.from(jsonDecode(question.answer ?? "[]"))
                .contains(option.sequence));
        if ((options ?? []).isNotEmpty) {
          return options.map((e) => e.option).toList().join(', ');
        }
        return "-";
      case 'TEXTO REPRESENTANTE':
        return question.answer ?? " - ";

      default:
        return " -- ";
    }
  }
}
