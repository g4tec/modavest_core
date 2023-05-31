import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/product_stock.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/features/bag/presentation/widgets/counting_item_bag.dart';
import 'package:modavest_core/widgets/fields/number_with_controls_input.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';
import 'package:modavest_core/widgets/text/modavest_money_bold_text.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class EditItemAmountBag extends StatefulWidget {
  final color_entitie.Color color;
  final String referenceName;
  final String referenceCode;
  final bool referenceIsPack;
  // TODO: Remover if need
  // final String brandName;
  final bool disableExpand;
  final Map<Product, int> productAmount;
  final num subtotal;
  final num amount;
  final bool? isChecked;
  final Function(
    Product,
    int,
    num,
    num, {
    Function({List<SalesOrder>? bagOrders})? callBack,
  }) onchangeProductAmount;
  final List<ProductPrice> prices;
  final num? officialStoreCode;
  final num? priceTableCode;
  final num? conditionCode;
  final Function()? initDiscount;
  final Function(bool)? onCheckBoxItemChange;
  final void Function({
    required int quantity,
    List<SalesOrder>? bagOrders,
  })? updatePrices;
  final Widget Function(ProductPrice?) buildPriceLabel;
  final Widget Function(String? url)? buildImage;
  final List<ProductStock>? productStock;

  const EditItemAmountBag({
    super.key,
    required this.color,
    this.disableExpand = false,
    required this.productAmount,
    required this.referenceName,
    required this.referenceCode,
    required this.onchangeProductAmount,
    required this.referenceIsPack,
    required this.prices,
    required this.officialStoreCode,
    required this.priceTableCode,
    required this.conditionCode,
    required this.subtotal,
    required this.amount,
    required this.initDiscount,
    required this.updatePrices,
    required this.buildPriceLabel,
    this.isChecked,
    this.onCheckBoxItemChange,
    this.buildImage,
    this.productStock,
  });

  @override
  EditItemAmountBagState createState() => EditItemAmountBagState();
}

class EditItemAmountBagState extends State<EditItemAmountBag>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey tableSizes = GlobalKey(debugLabel: "tableSizes");

  @override
  void initState() {
    super.initState();
    widget.initDiscount?.call();
  }

  void onChangeInGlobalInput(int value, int amount) {
    (tableSizes.currentState! as CountingItemBagState).setValueAll(amount);
  }

  void onTypeGlobalInput(int value) {
    (tableSizes.currentState! as CountingItemBagState).setValueAll(value);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      backgroundColor:
          widget.disableExpand ? Colors.transparent : const Color(0xfff5f5f5),
      collapsedBackgroundColor:
          widget.disableExpand ? Colors.transparent : const Color(0xfff5f5f5),
      collapsedIconColor: widget.disableExpand
          ? Colors.transparent
          : Theme.of(context).primaryColor,
      iconColor: widget.disableExpand
          ? Colors.transparent
          : Theme.of(context).primaryColor,
      tilePadding: widget.disableExpand
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 16),
      title: InkWell(
        onTap: widget.onCheckBoxItemChange != null
            ? () =>
                widget.onCheckBoxItemChange?.call(!(widget.isChecked ?? true))
            : null,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            child: Row(
              children: [
                if (widget.isChecked != null)
                  Checkbox(
                      value: widget.isChecked,
                      onChanged: (value) =>
                          widget.onCheckBoxItemChange?.call(value ?? false)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: widget.buildImage?.call(
                          () {
                            try {
                              return widget.color.imgList.first;
                            } catch (e) {
                              return null;
                            }
                          }.call()?.image,
                        ) ??
                        ImageColorReferenceView(
                          prefixKey: "bagStore",
                          imageColorReference: () {
                            try {
                              return widget.color.imgList.first;
                            } catch (e) {
                              return null;
                            }
                          }.call(),
                          fit: BoxFit.cover,
                          cacheWidth: 50,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModavestTitle(
                        "${widget.referenceName} - ${widget.color.name!}",
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: AutoSizeText(
                          "${ModaVestLabels.ref}: ${widget.referenceCode}",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: ModavestMoneyBoldText(
                          originalValue: widget.subtotal.toDouble(),
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: AutoSizeText(
                          "${ModaVestLabels.qtdProduct}: ${widget.amount.toInt()}",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // TODO: marca
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 2),
                      //   child: AutoSizeText(
                      //     "${ModaVestLabels.brand}: ${widget.brandName}",
                      //     style: Theme.of(context).textTheme.headline5,
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      children: [
        if (widget.referenceIsPack)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  widget.referenceIsPack
                      ? ModaVestLabels.porPack
                      : ModaVestLabels.porUnidade,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 140,
                  ),
                  child: NumberWithControlsInput(
                    onChange: onChangeInGlobalInput,
                    controller: TextEditingController(
                      text: (widget.productAmount.values.first ~/
                              int.parse(
                                widget.productAmount.keys.first.packAmount ??
                                    "1",
                              ))
                          .toString(),
                    ),
                    onChangeByTyping: onTypeGlobalInput,
                  ),
                ),
              ],
            ),
          ),
        if (!widget.disableExpand)
          FittedBox(
            child: CountingItemBag(
              productStock: widget.productStock,
              key: tableSizes,
              color: widget.color,
              disableInputsControls: widget.referenceIsPack,
              productAmount: widget.productAmount,
              onchangeProductAmount: widget.onchangeProductAmount,
              isPack: widget.referenceIsPack,
              prices: widget.prices,
              officialStoreCode: widget.officialStoreCode,
              priceTableCode: widget.priceTableCode,
              conditionCode: widget.conditionCode,
              updatePrices: widget.updatePrices,
              buildPriceLabel: widget.buildPriceLabel,
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => false;
}
