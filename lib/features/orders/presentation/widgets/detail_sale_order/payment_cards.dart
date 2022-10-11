import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_money.dart';
import 'package:modavest_core/utils/format_cnpj_cpf.dart';

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
          title: "Meio de pagamento",
          title2: salesOrder.paymentConditionName ?? " - ",
          context: context,
        ),
        buildRow(
          title: "Nome do titlular",
          title2: salesOrder.customerName ?? " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "CPF/CNPJ do titular",
          title2: formatCnpjCpf(salesOrder.customerCnpj ?? "-"),
          context: context,
        ),
        buildRow(
          title: "Total do itens",
          title2: toCurrency(salesOrder.totalAmountOrder ?? 0),
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Acrécimos/decontos",
          title2: toCurrency((salesOrder.discountValue ?? 0).toDouble()),
          context: context,
        ),
      ],
    );
  }
}
