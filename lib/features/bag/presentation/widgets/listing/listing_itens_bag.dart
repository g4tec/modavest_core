import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/category_item_sales_order.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/card_listing_bag_store.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/delete_header_bag.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/edit_item_amount_bag.dart';

class ListingItensBag extends StatefulWidget {
  final List<SalesOrder> salesOrders;
  final void Function()? onCloseTitle;
  final int? selecetedSalesOrderIndex;
  final Function(int) onSelectSalesOrder;
  final Widget Function(String) countingBuildWidget;
  final void Function({
    required Product product,
    required int value,
    required num price,
    required num originalPrice,
    required SalesOrder saleOrder,
    required ColorItemSalesOrder colorItems,
    num? scaleCode,
    Function({List<SalesOrder>? bagOrders})? callBack,
  }) onchangeProductAmount;
  final Function({
    required List<ProductPrice?>? prices,
    num? oficialStoreId,
    num? priceTableCode,
    required Reference? reference,
  })? initDiscount;
  final void Function({
    required int quantity,
    List<SalesOrder>? bagOrders,
    num? oficialStoreId,
    num? priceTableCode,
    Reference? reference,
    List<ProductPrice>? prices,
  })? updatePrices;

  final Widget Function(ProductPrice?) buildPriceLabel;
  final void Function(List<SalesOrder> salesOrders) deleteSalesOrder;
  final Function() onPop;
  const ListingItensBag({
    super.key,
    required this.salesOrders,
    this.onCloseTitle,
    required this.selecetedSalesOrderIndex,
    required this.onSelectSalesOrder,
    required this.onchangeProductAmount,
    required this.initDiscount,
    required this.updatePrices,
    required this.buildPriceLabel,
    required this.deleteSalesOrder,
    required this.onPop,
    required this.countingBuildWidget,
  });

  @override
  ListingItensBagState createState() => ListingItensBagState();
}

class ListingItensBagState extends State<ListingItensBag> {
  bool showCheckBoxes = false;
  bool selectAll = false;
  Map<String, Key> itensKeys = {};
  Map<String, bool> selecteds = {};

  // ignore: avoid_positional_boolean_parameters
  void setSelection(bool? value) {
    setState(() {
      showCheckBoxes = value!;
    });
  }

  // ignore: avoid_positional_boolean_parameters
  void changeAll(bool? value) {
    selecteds.updateAll((key, box) => value!);
    setState(() {
      selectAll = value!;
    });
  }

  @override
  void initState() {
    for (final SalesOrder salesOrder in widget.salesOrders) {
      itensKeys.putIfAbsent(
        salesOrder.orderId!,
        () => GlobalKey(
          debugLabel: salesOrder.orderId,
        ),
      );
      selecteds.putIfAbsent(salesOrder.orderId!, () => false);
    }

    super.initState();
  }

  // ignore: avoid_positional_boolean_parameters
  void onChildChange(bool value) {
    if (selectAll) {
      setState(() {
        selectAll = false;
      });
    }
  }

  void setCheckBox({required bool value, required String orderId}) {
    setState(() {
      selecteds[orderId] = value;
    });
  }

  Map<Product, int> buildGridAmount(ColorItemSalesOrder colorItem) {
    final Map<Product, int> productAmount = {};

    for (final ItemSalesOrder item in colorItem.items) {
      final int index = colorItem.color.products
          .indexWhere((product) => product.code == item.productCode);

      if (index >= 0) {
        final Product product = colorItem.color.products[index];
        productAmount.putIfAbsent(product, () => (item.quantity ?? 0).toInt());
      }
    }
    return productAmount;
  }

  Future<List<Widget>> buildItems() async {
    await Future.delayed(
      Duration(
        milliseconds: 10 * widget.salesOrders.length,
      ),
    );
    return widget.salesOrders
        .asMap()
        .map(
          (int index, SalesOrder saleOrder) {
            return MapEntry(
              index,
              Opacity(
                opacity: widget.selecetedSalesOrderIndex == index ? 1 : 0.5,
                child: CardListingBagStore(
                  showCheckBox: showCheckBoxes,
                  onSelectSalesOrder: () =>
                      widget.onSelectSalesOrder.call(index),
                  key: itensKeys[saleOrder.orderId],
                  orderId: saleOrder.orderId ?? "",
                  image: saleOrder.oficialStore?.logoUrl ?? "",
                  title: saleOrder.oficialStore?.description ?? "",
                  value: selecteds[saleOrder.orderId] ?? false,
                  onChange: onChildChange,
                  onSelect: setCheckBox,
                  countingBuildWidget: widget.countingBuildWidget,
                  children: saleOrder.colorItems
                      .asMap()
                      .map((
                        int index,
                        ColorItemSalesOrder colorItems,
                      ) {
                        return MapEntry(
                          index,
                          FutureBuilder<Widget>(
                            future: buildItem(colorItems, saleOrder, index),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!;
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ),
            );
          },
        )
        .values
        .toList();
  }

  Future<Widget> buildItem(
    ColorItemSalesOrder colorItems,
    SalesOrder saleOrder,
    int index,
  ) async {
    await Future.delayed(
      Duration(
        milliseconds: 100 * index,
      ),
    );
    final List<ProductPrice> prices = [];

    for (final ItemSalesOrder itens in colorItems.items) {
      prices.addAll(
        itens.reference?.referencePrice?.prices ?? [],
      );
    }

    return EditItemAmountBag(
      subtotal: colorItems.subtotal,
      amount: colorItems.amount,
      color: colorItems.color,
      referenceCode: colorItems.items.first.referenceCode ?? "",
      referenceName:
          "${colorItems.items.first.referenceCode ?? ""} - ${colorItems.items.first.referenceName ?? ""}",
      referenceIsPack: colorItems.items.first.referenceIsPack ?? false,
      productAmount: buildGridAmount(colorItems),
      prices: prices,
      priceTableCode: saleOrder.priceTableCode,
      officialStoreCode: saleOrder.officialStoreId,
      conditionCode: saleOrder.paymentconditionCode,
      reference: colorItems.items.first.reference,
      onchangeProductAmount: (
        Product product,
        int value,
        num price,
        num originalPrice, {
        Function({List<SalesOrder>? bagOrders})? callBack,
      }) =>
          widget.onchangeProductAmount.call(
        saleOrder: saleOrder,
        product: product,
        price: price,
        originalPrice: originalPrice,
        callBack: callBack,
        value: value,
        colorItems: colorItems,
        scaleCode: () {
          try {
            return prices
                .firstWhere(
                  (element) => element.productCode == product.code,
                )
                .scaleCode;
          } catch (e) {
            return null;
          }
        }.call(),
      ),
      initDiscount: () => widget.initDiscount?.call(
        prices: prices,
        oficialStoreId: saleOrder.officialStoreId,
        priceTableCode: saleOrder.priceTableCode,
        reference: colorItems.items.first.reference,
      ),
      updatePrices: ({
        required int quantity,
        List<SalesOrder>? bagOrders,
      }) =>
          widget.updatePrices?.call(
        quantity: quantity,
        bagOrders: bagOrders,
        oficialStoreId: saleOrder.officialStoreId,
        priceTableCode: saleOrder.priceTableCode,
        reference: colorItems.items.first.reference,
        prices: prices,
      ),
      buildPriceLabel: widget.buildPriceLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        if (showCheckBoxes)
          DeleteHeaderBag(
            key: GlobalKey(),
            value: selectAll,
            onChange: changeAll,
            onDelete: () {
              final List<SalesOrder> deleteOrderSale = [];
              selecteds.forEach((key, value) {
                if (value) {
                  final int index = widget.salesOrders
                      .indexWhere((element) => element.orderId == key);

                  if (index >= 0) {
                    deleteOrderSale.add(
                      widget.salesOrders[index],
                    );
                  }
                }
              });
              widget.deleteSalesOrder.call(deleteOrderSale);
              setSelection(false);
              widget.onCloseTitle?.call();
            },
          ),
        FutureBuilder<List<Widget>>(
          future: buildItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: snapshot.data!);
            }

            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () => widget.onPop.call(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(ModaVestLabels.continueBuying)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
