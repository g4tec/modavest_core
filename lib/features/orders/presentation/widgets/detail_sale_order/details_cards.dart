import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_date.dart';

class DetailsCard extends StatelessWidget {
  final SalesOrder salesOrder;
  const DetailsCard({
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: AutoSizeText(
              title2,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    num? settledQuantity = salesOrder.items?.fold(
        0.0,
        (previousValue, element) =>
            (previousValue ?? 0) + (element.settledQuantity ?? 0));
    return ListView(
      children: [
        buildRow(
          title: "Cliente",
          title2: salesOrder.customerName?.toString() ?? " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "CPF/CNPJ",
          title2: salesOrder.customerCnpj ?? " - ",
          context: context,
        ),
        buildRow(
          title: "Data do pedido",
          title2: salesOrder.orderDate != null
              ? formatDate(salesOrder.orderDate!)
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Data da chegada",
          title2: salesOrder.arrivalDate != null
              ? formatDate(salesOrder.arrivalDate!)
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Nº do pedido",
          title2: salesOrder.orderCode?.toString() ?? " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Nº do pedido do cliente",
          title2: salesOrder.customerOrderCode?.toString() ?? " - ",
          context: context,
        ),
        buildRow(
          title: "Qt. de peças faturadas",
          title2: settledQuantity != null
              ? settledQuantity == 0 &&
                      (salesOrder.items ?? []).isEmpty &&
                      salesOrder.items!.first.settledQuantity != null
                  ? settledQuantity.toString()
                  : settledQuantity == 0
                      ? " - "
                      : settledQuantity.toString()
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Qt. de peças solicitadas",
          title2: salesOrder.quantity?.toString() ?? " - ",
          context: context,
        ),
        if (salesOrder.reasonBlockingDescription != null)
          buildRow(
            title: "Motivo de bloqueio",
            title2: salesOrder.reasonBlockingDescription ?? " - ",
            context: context,
            filled: true,
          ),
        if (salesOrder.reasonCancellationDescription != null)
          buildRow(
            title: "Motivo de cancelamento",
            title2: salesOrder.reasonCancellationDescription ?? " - ",
            context: context,
            filled: salesOrder.reasonBlockingDescription == null,
          ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
