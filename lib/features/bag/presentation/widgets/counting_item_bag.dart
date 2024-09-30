import "package:collection/collection.dart";
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_sizes.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/product_stock.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/non_fracionals.dart';
import 'package:modavest_core/utils/uniques.dart';
import 'package:modavest_core/widgets/fields/number_with_controls_input.dart';

class CountingItemBag extends StatefulWidget {
  final color_entitie.Color color;
  final bool disableInputsControls;
  final Map<Product, num?> productAmount;
  final List<ProductStock>? productStock;
  final bool showAmountColor;
  final Function(
    Product,
    num,
    num,
    num, {
    Function({List<SalesOrder>? bagOrders})? callBack,
  }) onchangeProductAmount;
  final bool isPack;
  final List<ProductPrice> prices;
  final num? officialStoreCode;
  final num? priceTableCode;
  final num? conditionCode;
  final Function()? onAddProduct;

  final Widget Function(ProductPrice?) buildPriceLabel;

  final void Function({
    required num quantity,
    List<SalesOrder>? bagOrders,
  })? updatePrices;

  const CountingItemBag({
    super.key,
    required this.color,
    this.disableInputsControls = false,
    required this.productAmount,
    required this.onchangeProductAmount,
    required this.isPack,
    required this.prices,
    this.officialStoreCode,
    required this.priceTableCode,
    this.conditionCode,
    this.showAmountColor = false,
    this.updatePrices,
    required this.buildPriceLabel,
    this.productStock,
    this.onAddProduct,
  });

  @override
  CountingItemBagState createState() => CountingItemBagState();
}

class CountingItemBagState extends State<CountingItemBag> {
  late Map<String, GlobalKey> keys = {};

  final ValueNotifier<num> amountValue = ValueNotifier(0);
  @override
  void initState() {
    // TODO: paleativo para a duplicação dos produtos
    final List<Product> products = widget.color.products;
    for (final Product e in products.unique((e) => e.code)) {
      keys.putIfAbsent(
        e.code.toString() + (e.colorCode),
        () => GlobalKey(
          debugLabel: e.size.toString() + widget.color.name!,
        ),
      );
    }

    amountValue.value =
        widget.productAmount.entries.fold(0, (previousValue, element) {
      if (element.key.colorCode == widget.color.code) {
        return previousValue + (element.value ?? 0.0);
      }
      return previousValue;
    });

    super.initState();
  }

  void incremetAll() {
    for (final GlobalKey element in keys.values) {
      final widget = element.currentWidget as NumberWithControlsInput?;
      widget?.increment();
    }
  }

  void decrementAll() {
    for (final GlobalKey element in keys.values) {
      final widget = element.currentWidget as NumberWithControlsInput?;
      widget?.decrement();
    }
  }

  void setValueAll(num value) {
    for (final GlobalKey element in keys.values) {
      final widget = element.currentWidget as NumberWithControlsInput?;
      if (widget?.maxValue != null && value >= widget!.maxValue!) {
        widget.setValue(widget.maxValue!);
        widget.onChange!(0, widget.maxValue!);
      } else {
        widget?.setValue(value);

        widget?.onChange!(0, value);
      }
    }
  }

  void getTotalColorAmount() {
    final int subtotal = keys.entries.fold(
      0,
      (previousValue, key) =>
          previousValue +
          (int.tryParse(
                (key.value.currentWidget as NumberWithControlsInput?)
                        ?.controller
                        .text ??
                    '0',
              ) ??
              0),
    );
    amountValue.value = subtotal;
  }

  List<DataRow> _buildRows(
    Map<Product, num?>? values,
  ) {
    final List<Product> products = widget.color.products;

    products.sort(
      (a, b) => sizes.indexWhere((element) => element == a.size!).compareTo(
            sizes.indexWhere((element) => element == b.size!),
          ),
    );

    final List<DataRow> rows = [];
    for (final element in products) {
      final ProductPrice? price = widget.prices.firstWhereOrNull(
        (price) => price.productCode == element.code,
      );

      final Widget priceLabel = widget.buildPriceLabel.call(price);
      rows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Center(
                child: Text(
                  element.size ?? "",
                ),
              ),
            ),
            if ((widget.productStock ?? []).isNotEmpty)
              DataCell(
                Center(
                  child: Text(
                    "${widget.productStock?.firstWhereOrNull((stock) => stock.productCode == element.code)?.stock?.toString() ?? "0"} ${element.measuredUnit ?? ""}",
                  ),
                ),
              ),
            DataCell(
              Center(
                child: priceLabel,
              ),
            ),
            DataCell(
              widget.isPack
                  ? Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            constraints: const BoxConstraints(
                              minWidth: 140,
                            ),
                            child: NumberWithControlsInput(
                              fractional:
                                  !nonFractional.contains(element.measuredUnit),
                              maxValue: (widget.productStock ?? []).isNotEmpty
                                  ? widget.productStock
                                          ?.firstWhereOrNull((stock) =>
                                              stock.productCode == element.code)
                                          ?.stock
                                          ?.toInt() ??
                                      0
                                  : null,
                              onChangeByTyping: (num amount) {
                                widget.onchangeProductAmount(
                                  element,
                                  amount,
                                  price?.price ?? price?.originalPrice ?? 0,
                                  price?.originalPrice ?? 0,
                                  callBack: ({List<SalesOrder>? bagOrders}) =>
                                      widget.updatePrices?.call(
                                    quantity: amount,
                                  ),
                                );
                                if (widget.showAmountColor) {
                                  getTotalColorAmount.call();
                                }
                              },
                              onChange: (int value, num amount) {
                                if (!widget.isPack) {
                                  widget.onchangeProductAmount(
                                    element,
                                    amount,
                                    price?.price ?? price?.originalPrice ?? 0,
                                    price?.originalPrice ?? 0,
                                    callBack: ({List<SalesOrder>? bagOrders}) =>
                                        widget.updatePrices?.call(
                                      quantity: amount,
                                    ),
                                  );
                                }
                                if (widget.showAmountColor) {
                                  getTotalColorAmount.call();
                                }
                              },
                              value: values?[element],
                              controller: TextEditingController(
                                text: (values?[element] ?? 0)
                                    .toString()
                                    .replaceAll('.', ','),
                              ),
                              key: keys[
                                  element.code.toString() + element.colorCode],
                              disableControls: widget.isPack,
                              stepSize: widget.isPack
                                  ? int.parse(element.packAmount ?? "1")
                                  : 1,
                            ),
                          ),
                        ),
                        ColoredBox(
                          color: Colors.transparent,
                          child: Column(
                            children: [Row()],
                          ),
                        ),
                      ],
                    )
                  : Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 140,
                        ),
                        child: NumberWithControlsInput(
                          fractional:
                              !nonFractional.contains(element.measuredUnit),
                          maxValue: (widget.productStock ?? []).isNotEmpty
                              ? widget.productStock
                                      ?.firstWhereOrNull((stock) =>
                                          stock.productCode == element.code)
                                      ?.stock
                                      ?.toInt() ??
                                  0
                              : null,
                          onChangeByTyping: (num amount) {
                            widget.onchangeProductAmount(
                              element,
                              amount,
                              price?.price ?? price?.originalPrice ?? 0,
                              price?.originalPrice ?? 0,
                              callBack: ({List<SalesOrder>? bagOrders}) =>
                                  widget.updatePrices?.call(
                                quantity: amount,
                              ),
                            );
                            if (widget.showAmountColor) {
                              getTotalColorAmount.call();
                            }
                          },
                          onChange: (int value, num amount) {
                            if (!widget.isPack) {
                              widget.onchangeProductAmount(
                                element,
                                amount,
                                price?.price ?? price?.originalPrice ?? 0,
                                price?.originalPrice ?? 0,
                                callBack: ({List<SalesOrder>? bagOrders}) =>
                                    widget.updatePrices?.call(
                                  quantity: amount,
                                  bagOrders: bagOrders,
                                ),
                              );
                            }
                            if (widget.showAmountColor) {
                              getTotalColorAmount.call();
                            }
                          },
                          value: values?[element],
                          controller: TextEditingController(
                            text: (values?[element] ?? 0)
                                .toString()
                                .replaceAll('.', ','),
                          ),
                          key:
                              keys[element.code.toString() + element.colorCode],
                          disableControls: widget.isPack,
                          stepSize: widget.isPack
                              ? int.parse(element.packAmount ?? "1")
                              : 1,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  List<DataColumn> _buildHeader() {
    return [
      DataColumn(
        label: FittedBox(
          child: Text(ModaVestLabels.tamanho),
        ),
      ),
      if ((widget.productStock ?? []).isNotEmpty)
        DataColumn(
          label: FittedBox(
            child: Text(ModaVestLabels.estoque),
          ),
        ),
      DataColumn(
        label: FittedBox(
          child: Text(ModaVestLabels.price +
              (widget.color.products.firstOrNull?.measuredUnit ?? "")),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(ModaVestLabels.amountProduct),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(color: Colors.transparent),
          ),
          child: DataTable(
            columns: _buildHeader(),
            rows: [
              ..._buildRows(widget.productAmount),
            ],
            columnSpacing: 10,
          ),
        ),
        if (widget.onAddProduct != null) ...[
          GestureDetector(
            onTap: () => widget.onAddProduct?.call(),
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Adicionar novo produto",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Theme.of(context).primaryColor,
                    ),
                    width: 32,
                    height: 32,
                    child: FittedBox(
                      child: IconButton(
                        splashRadius: 26,
                        icon: Icon(
                          Icons.add,
                          size: 16,
                          color: Theme.of(context).canvasColor,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        if (widget.showAmountColor)
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 30),
            child: ValueListenableBuilder(
              valueListenable: amountValue,
              builder: (context, value, _) {
                return Text(
                  "${ModaVestLabels.qtdProduct}: ${value.toString().replaceAll('.', ',')}",
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
          ),
      ],
    );
  }
}
