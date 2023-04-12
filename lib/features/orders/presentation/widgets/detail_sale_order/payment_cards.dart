import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_money.dart';

class PaymentDetailCard extends StatelessWidget {
  final SalesOrder salesOrder;
  const PaymentDetailCard({
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
      children: [
        buildRow(
          title: "Tabela de preço",
          title2: salesOrder.priceTableCode?.toString() ?? " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Cond. de pagamento",
          title2: salesOrder.paymentConditionName ?? " - ",
          context: context,
        ),
        buildRow(
          title: "Tipo de cobrança",
          title2: salesOrder.chargeType?.toString() ?? " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Frete",
          title2: freightTypes[salesOrder.freightType] ?? "-",
          context: context,
        ),
        buildRow(
          title: "Acréscimos/decontos",
          title2: salesOrder.discountValue != null
              ? toCurrency((salesOrder.discountValue ?? 0).toDouble())
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Valor do frete",
          title2: salesOrder.freightValue != null
              ? toCurrency(salesOrder.freightValue ?? 0)
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Desconto capa",
          title2: toCurrency((salesOrder.discounts?.fold(
                      0.0,
                      (previousValue, element) =>
                          previousValue +
                          (element.value ??
                              ((element.percentage ?? 0) *
                                  (salesOrder.totalOriginalAmountOrder ??
                                      0)))) ??
                  0)
              .toDouble()),
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Total do líquido",
          title2: toCurrency(salesOrder.totalAmountOrder ?? 0),
          context: context,
        ),
      ],
    );
  }
}
