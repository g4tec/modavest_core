import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
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
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: (salesOrder.classifications ?? [])
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
            .toList());
  }
}
