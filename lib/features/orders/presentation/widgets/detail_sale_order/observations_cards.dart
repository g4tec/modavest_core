import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

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
                .headline5
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            title2,
            style: Theme.of(context).textTheme.headline5,
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
                  .headline5
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
                  .headline5
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
      ],
    );
  }
}
