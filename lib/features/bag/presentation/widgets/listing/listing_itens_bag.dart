import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/category_item_sales_order.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/reference_simple.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/card_listing_bag_store.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/delete_header_bag.dart';
import 'package:modavest_core/features/bag/presentation/widgets/listing/edit_item_amount_bag.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';

class ListingItensBag extends StatefulWidget {
  final bool isDismembration;
  final List<ColorItemSalesOrder>? selectedColorItems;

  final void Function(String, bool)? onSelectCheckBox;
  final List<SalesOrder> salesOrders;
  final void Function()? onCloseTitle;
  final int? selecetedSalesOrderIndex;
  final Function(int) onSelectSalesOrder;
  final Widget Function(String) countingBuildWidget;
  final void Function({
    required Product product,
    required num value,
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
  })? initDiscount;
  final void Function({
    required num quantity,
    List<SalesOrder>? bagOrders,
    num? oficialStoreId,
    num? priceTableCode,
    List<ProductPrice>? prices,
  })? updatePrices;

  final Widget Function(ProductPrice?) buildPriceLabel;
  final void Function(List<SalesOrder> salesOrders) deleteSalesOrder;
  final Function() onPop;
  final Function(ColorItemSalesOrder, bool)? onCheckBoxItemChange;
  final Widget Function(String?)? buildImage;
  final List<ProductPrice>? prices;
  final bool showNotIncluded;
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
    this.isDismembration = false,
    this.selectedColorItems,
    this.onSelectCheckBox,
    this.onCheckBoxItemChange,
    this.buildImage,
    this.prices,
    this.showNotIncluded = false,
  });

  @override
  ListingItensBagState createState() => ListingItensBagState();
}

class ListingItensBagState extends State<ListingItensBag> {
  late bool showCheckBoxes;
  bool selectAll = false;
  Map<String, Key> itensKeys = {};
  Map<String, bool> selecteds = {};
  SalesOrder? expandSaleOrder;

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
    showCheckBoxes =
        widget.isDismembration && widget.selectedColorItems == null;
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
    if (widget.isDismembration) {
      selecteds.updateAll((key, value) => false);

      widget.onSelectCheckBox?.call(orderId, value);
    }
    setState(() {
      selecteds[orderId] = value;
    });
  }

  Map<Product, num> buildGridAmount(ColorItemSalesOrder colorItem) {
    final Map<Product, num> productAmount = {};

    for (final ItemSalesOrder item in colorItem.items) {
      final int index = colorItem.color.products
          .indexWhere((product) => product.code == item.productCode);

      if (index >= 0) {
        final Product product = colorItem.color.products[index];
        productAmount.putIfAbsent(product, () => (item.quantity ?? 0.0));
      }
    }
    return productAmount;
  }

  List<Widget> buildItems() {
    // await Future.delayed(
    //   Duration(
    //     milliseconds: 10 * widget.salesOrders.length,
    //   ),
    // );

    return widget.salesOrders
        .asMap()
        .map(
          (int index, SalesOrder saleOrder) {
            return MapEntry(
              index,
              Opacity(
                opacity: widget.selecetedSalesOrderIndex == index ||
                        widget.isDismembration
                    ? 1
                    : 0.5,
                child: CardListingBagStore(
                  showCheckBox: showCheckBoxes,
                  onExpand: () {
                    setState(() => expandSaleOrder = saleOrder);
                  },
                  onSelectSalesOrder: () {
                    widget.onSelectSalesOrder.call(index);
                  },
                  key: itensKeys[saleOrder.orderId],
                  buildImage: widget.buildImage,
                  orderId: saleOrder.orderId ?? "",
                  image: saleOrder.oficialStore?.logoUrl ?? "",
                  title: saleOrder.oficialStore?.description ?? "",
                  value: selecteds[saleOrder.orderId] ?? false,
                  onChange: onChildChange,
                  onSelect: setCheckBox,
                  countingBuildWidget: widget.countingBuildWidget,
                  child: SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: "Tab. Preço: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                            ),
                        children: [
                          TextSpan(
                            text:
                                "${saleOrder.priceTableCode?.toString() ?? ""}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
        .values
        .toList();
  }

  Widget buildItem(
    ColorItemSalesOrder colorItems,
    SalesOrder saleOrder,
    int index,
  ) {
    // await Future.delayed(
    //   Duration(
    //     milliseconds: 100 * index,
    //   ),
    // );
    final List<ProductPrice> prices = [];

    final ReferenceSimple? referenceSimple = colorItems.items
        .firstWhereOrNull((item) => item.referenceSimple != null)
        ?.referenceSimple;

    prices.addAll(referenceSimple?.referencePrice?.prices ?? []);
    // for (final ItemSalesOrder itens in colorItems.items) {
    //   if ((itens.price ?? 0) > 0) {
    //     final ProductPrice? price =
    //         (referenceSimple?.referencePrice?.prices ?? []).firstWhereOrNull(
    //             (price) => price.productCode == itens.productCode);
    //     if (price != null) {
    //       prices.add(price);
    //     }
    //   }
    // }

    return EditItemAmountBag(
      productStock: colorItems.productStock,
      notIncludedAmount: colorItems.notIncludedAmount,
      subtotal: colorItems.subtotal,
      amount: colorItems.amount,
      color: colorItems.color,
      defaultImage: referenceSimple?.imageColorReference,
      buildImage: widget.buildImage,
      referenceCode: colorItems.items.first.referenceCode ?? "",
      referenceName:
          "${colorItems.items.first.referenceCode ?? ""} - ${colorItems.items.first.referenceName ?? ""}",
      referenceIsPack: colorItems.items.first.referenceIsPack ?? false,
      productAmount: buildGridAmount(colorItems),
      prices: prices,
      disableExpand: widget.isDismembration,
      isChecked: widget.selectedColorItems?.contains(colorItems),
      onCheckBoxItemChange: (value) {
        widget.onCheckBoxItemChange?.call(colorItems, value);
      },
      priceTableCode: saleOrder.priceTableCode,
      officialStoreCode: saleOrder.officialStoreId,
      conditionCode: saleOrder.paymentConditionCode,
      // TODO: rever
      // reference: colorItems.items.first.reference,
      onchangeProductAmount: (
        Product product,
        num value,
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
      ),
      updatePrices: ({
        required num quantity,
        List<SalesOrder>? bagOrders,
      }) =>
          widget.updatePrices?.call(
        quantity: quantity,
        bagOrders: bagOrders,
        oficialStoreId: saleOrder.officialStoreId,
        priceTableCode: saleOrder.priceTableCode,
        // TODO: rever
        // reference: colorItems.items.first.reference,
        prices: prices,
      ),
      buildPriceLabel: widget.buildPriceLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;

    if (expandSaleOrder != null) {
      return ListView.builder(
        itemCount: expandSaleOrder!.colorItems.length + 2,
        addAutomaticKeepAlives: false,
        cacheExtent: 5,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                widget.onSelectSalesOrder.call(index);
              },
              child: Opacity(
                opacity: widget.selecetedSalesOrderIndex == index ||
                        widget.isDismembration
                    ? 1
                    : 0.5,
                child: ListTile(
                  title: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: aspectRatio < 0.6 ? 16 : 32,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFE4E4E4),
                          width: 1,
                        ),
                        left: BorderSide(
                          color: Color(0xFFE4E4E4),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Color(0xFFE4E4E4),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFE4E4E4),
                          width: 1,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          // const SizedBox(),
                          SizedBox(
                            height: MediaQuery.of(context).size.width *
                                (aspectRatio < 0.6 ? 0.2 : 0.18),
                            width: MediaQuery.of(context).size.width *
                                (aspectRatio < 0.6 ? 0.3 : 0.22),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Padding(
                                padding: const EdgeInsets.all(0.5),
                                child: widget.buildImage?.call(
                                    expandSaleOrder?.oficialStore?.logoUrl),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AutoSizeText(
                                  expandSaleOrder?.oficialStore?.description ??
                                      "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 16,
                                      ),
                                ),
                                widget.countingBuildWidget
                                    .call(expandSaleOrder!.orderId ?? ""),
                                SizedBox(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Tab. Preço: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 16,
                                          ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "${expandSaleOrder?.priceTableCode?.toString() ?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height * 0.14,
                            child: IconButton(
                              onPressed: () =>
                                  setState(() => expandSaleOrder = null),
                              icon: const Icon(Icons.expand_less),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          if ((expandSaleOrder!.colorItems.length + 2) == (index + 1)) {
            return Transform.translate(
              offset: Offset(0.0, -8.0),
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: aspectRatio < 0.6 ? 32 : 47),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE4E4E4),
                    ),
                  ),
                ),
              ),
            );
          }
          return Transform.translate(
            offset: Offset(0.0, -8.0),
            child: buildItem(expandSaleOrder!.colorItems[index - 1],
                expandSaleOrder!, index - 1),
          );
        },
      );
    }

    return ListView(
      shrinkWrap: true,
      cacheExtent: 2,
      children: [
        if (showCheckBoxes && !widget.isDismembration)
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
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                          child: Icon(
                            Icons.warning_amber,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Text(
                        ModaVestLabels.areYousureToDelete,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  content: Text(
                    ModaVestLabels.afterDeleteYouCantRowback,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ModaVestTextButton(
                        outlined: true,
                        onPressed: () => Navigator.of(context).pop(),
                        title: ModaVestLabels.cancelLabel,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ModaVestTextButton(
                        onPressed: () {
                          widget.deleteSalesOrder.call(deleteOrderSale);
                          setSelection(false);
                          widget.onCloseTitle?.call();
                        },
                        title: ModaVestLabels.yesDelete,
                        color: Colors.red,
                        colorText: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

        Column(
          children: buildItems(),
        ),
        // FutureBuilder<List<Widget>>(
        //   future: buildItems(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Column(children: snapshot.data!);
        //     }

        //     return const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        if (!widget.isDismembration)
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
