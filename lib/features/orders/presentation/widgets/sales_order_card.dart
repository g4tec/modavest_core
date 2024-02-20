import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_date.dart';
import 'package:modavest_core/widgets/text/modavest_money_bold_text.dart';

class SalesOrderCard extends StatelessWidget {
  final SalesOrder salesOrder;
  final void Function()? onSelect;
  final bool isFailed;
  const SalesOrderCard({
    super.key,
    required this.salesOrder,
    required this.onSelect,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isFailed
                            ? Theme.of(context).errorColor
                            : Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        isFailed
                            ? "${ModaVestLabels.seq} ${salesOrder.sequence?.toString() ?? ""}"
                            : "#${salesOrder.orderCode}",
                        maxFontSize: 20,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: isFailed
                                  ? Theme.of(context).errorColor
                                  : Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                child: Text(
                  salesOrder.customerName!.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromRGBO(79, 79, 79, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Espaçamento igual entre as colunas
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinha o conteúdo à esquerda
                      children: [
                        const Text(
                          "Valor",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ModavestMoneyBoldText(
                          originalValue: salesOrder.totalAmountOrder ?? 0,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    const Spacer(), // Espaço igual entre as colunas
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinha o conteúdo à esquerda
                      children: [
                        const Text(
                          "Data",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        AutoSizeText(
                          salesOrder.orderDate != null
                              ? formatDate(salesOrder.orderDate!)
                              : "",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    const Spacer(), // Espaço igual entre as colunas
                    if (salesOrder.quantity != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alinha o conteúdo à esquerda
                        children: [
                          const Text(
                            "Quantidade",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          AutoSizeText(
                            "${salesOrder.quantity}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
