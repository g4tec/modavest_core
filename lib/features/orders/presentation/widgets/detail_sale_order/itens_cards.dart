import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_sizes.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/utils/format_money.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';
import 'package:modavest_core/widgets/text/modavest_money_bold_text.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class ItensRequestCard extends StatelessWidget {
  final color_entitie.Color color;
  final String referenceName;
  final String referenceCode;
  final bool disableExpand;
  final List<ItemSalesOrder> itemSalesOrder;
  final String? measuredUnit;
  ItensRequestCard({
    super.key,
    required this.color,
    // this.brandName = "Kaisan Modas",
    this.disableExpand = false,
    required this.itemSalesOrder,
    required this.referenceName,
    required this.referenceCode,
    this.measuredUnit,
  });

  final Map<String, double> subtototal = {"subtotal": 0};

  List<DataRow> _buildRows() {
    const double padding = 10;
    itemSalesOrder.sort(
      (a, b) => sizes
          .indexWhere((element) => element == (a.sizeName ?? ""))
          .compareTo(
            sizes.indexWhere((element) => element == (b.sizeName ?? "")),
          ),
    );
    subtototal["subtotal"] = 0;
    final List<DataRow> rows = [];
    for (final ItemSalesOrder item in itemSalesOrder) {
      final double totalItem =
          (item.quantity?.toDouble() ?? 0) * (item.price ?? 0);
      subtototal["subtotal"] = totalItem + (subtototal["subtotal"] ?? 0);
      rows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding),
                  child: Text(
                    () {
                      try {
                        return item.sizeName ??
                            color.products
                                .firstWhere(
                                  (elementProd) =>
                                      elementProd.code == item.productCode,
                                )
                                .size ??
                            "";
                      } catch (e) {
                        return "";
                      }
                    }.call(),
                  ),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding),
                  child: FittedBox(
                    child: Text(
                      toCurrency((item.price ?? 0).toDouble()),
                    ),
                  ),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding),
                  child: FittedBox(
                    child: Text(
                      "${item.settledQuantity ?? "-"}/${item.quantity}"
                          .replaceAll('.', ','),
                    ),
                  ),
                ),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(vertical: padding),
                constraints: const BoxConstraints(maxWidth: 650),
                width: 65,
                child: FittedBox(
                  child: ModavestMoneyBoldText(originalValue: totalItem),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  List<DataColumn> _buildHeader(
    BuildContext context, {
    double columnSpacing = 20,
  }) {
    const double padding = 10;
    const int columns = 4;
    final double width = ((MediaQuery.of(context).size.width > 650
                ? 650
                : MediaQuery.of(context).size.width) /
            columns) -
        (columnSpacing * (columns - 1));
    return [
      DataColumn(
        label: Container(
          width: width - 10,
          padding: const EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  ModaVestLabels.tamanho,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  ModaVestLabels.price + (measuredUnit ?? ''),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: width + 10,
          padding: const EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  ModaVestLabels.qtdProductSettled,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  ModaVestLabels.value,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      backgroundColor:
          disableExpand ? Colors.transparent : const Color(0xfff5f5f5),
      collapsedBackgroundColor:
          disableExpand ? Colors.transparent : const Color(0xfff5f5f5),
      collapsedIconColor:
          disableExpand ? Colors.transparent : Theme.of(context).primaryColor,
      iconColor:
          disableExpand ? Colors.transparent : Theme.of(context).primaryColor,
      tilePadding: disableExpand
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 16),
      title: Container(
        width: MediaQuery.of(context).size.width,
        constraints: const BoxConstraints(maxWidth: 650),
        child: FittedBox(
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: ImageColorReferenceView(
                  imageColorReference: () {
                    try {
                      return color.imgList.first;
                    } catch (e) {
                      return null;
                    }
                  }.call(),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                constraints: const BoxConstraints(maxWidth: 650),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModavestTitle(
                      "$referenceName - ${color.name!}",
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: AutoSizeText(
                        "${ModaVestLabels.ref}: $referenceCode",
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      children: [
        DataTable(
          columns: _buildHeader(context, columnSpacing: 2),
          rows: [
            ..._buildRows(),
          ],
          columnSpacing: 2,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 650),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ModavestTitle(ModaVestLabels.itemSubtotal),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ModavestMoneyBoldText(
                    originalValue: subtototal["subtotal"] ?? 0,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
