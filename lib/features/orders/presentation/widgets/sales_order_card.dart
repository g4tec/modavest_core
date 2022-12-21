import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_date.dart';
import 'package:modavest_core/widgets/text/modavest_money_bold_text.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

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
      child: Card(
        child: FittedBox(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.all(10),
                child: AutoSizeText(
                  isFailed
                      ? "${ModaVestLabels.seq} ${salesOrder.sequence?.toString() ?? ""}"
                      : "#${salesOrder.orderCode}",
                  maxFontSize: 32,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: isFailed
                            ? Theme.of(context).errorColor
                            : Theme.of(context).primaryColor,
                        fontSize: 45,
                      ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModavestTitle(
                      salesOrder.customerName ?? " - ",
                      textAlign: TextAlign.left,
                    ),
                    ModavestMoneyBoldText(
                      originalValue: salesOrder.totalAmountOrder ?? 0,
                      fontSize: 16,
                    ),
                    AutoSizeText(
                      salesOrder.orderDate != null
                          ? formatDate(salesOrder.orderDate!)
                          : "",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    if (salesOrder.quantity != null)
                      AutoSizeText(
                        "${ModaVestLabels.amount} ${salesOrder.quantity}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    if (salesOrder.statusOrder != null &&
                        salesOrder.statusOrder == "PartiallyAnswered")
                      AutoSizeText(
                        ModaVestLabels.partiallyAnswered,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Colors.amber,
                            ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
