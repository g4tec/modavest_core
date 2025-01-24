import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/price_table_scales.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/product_stock.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/features/bag/presentation/widgets/counting_item_bag.dart';
import 'package:modavest_core/utils/non_fracionals.dart';
import 'package:modavest_core/widgets/fields/modavest_scale_field.dart';
import 'package:modavest_core/widgets/fields/number_with_controls_input.dart';

class AddItemByVariation extends StatelessWidget {
  final color_entitie.Color color;
  final Reference reference;
  final Map<Product, num?> productAmount;
  final Stream<List<Reference>>? referencesStream;
  final Function(Product, num, num, num, {Function()? callBack})
      onChangeProductAmount;
  final bool streamReferencesIsDoneValue;
  final Function(Reference)? getDiscountEvent;
  final Widget Function(ProductPrice?) buildPriceLabel;
  final Future<List<PriceTableScales>?>? getScale;
  final Function({
    required num quantity,
    List<SalesOrder>? bagOrders,
    required Reference referenceAux,
  })? updatePrices;
  final List<ProductStock>? productStock;
  final Function()? onAddProduct;
  final Function(Product product)? onTapOservations;

  AddItemByVariation({
    super.key,
    required this.reference,
    required this.color,
    required this.productAmount,
    required this.onChangeProductAmount,
    this.referencesStream,
    this.streamReferencesIsDoneValue = true,
    this.getDiscountEvent,
    required this.buildPriceLabel,
    this.getScale,
    this.updatePrices,
    this.productStock,
    this.onAddProduct,
    this.onTapOservations,
  });

  final GlobalKey tableSizes = GlobalKey(debugLabel: "tableSizes");

  void onChangeInGlobalInput(int value, num amount) {
    (tableSizes.currentState! as CountingItemBagState).setValueAll(amount);
  }

  void onTypeGlobalInput(num value) {
    (tableSizes.currentState! as CountingItemBagState).setValueAll(value);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  reference.isPack ?? false
                      ? ModaVestLabels.porPack
                      : ModaVestLabels.porUnidade,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (streamReferencesIsDoneValue && (reference.isPack ?? false))
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 140,
                    ),
                    child: NumberWithControlsInput(
                      key: GlobalKey(
                        debugLabel: "global${color.code}",
                      ),
                      onChange: onChangeInGlobalInput,
                      controller: TextEditingController(text: "0"),
                      onChangeByTyping: onTypeGlobalInput,
                      fractional: !nonFractional
                          .contains(color.products.firstOrNull?.measuredUnit),
                    ),
                  ),
              ],
            ),
          ),
          StreamBuilder(
            stream: referencesStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Reference>> snapshot,
            ) {
              Reference referenceAux = reference;
              final int? indexReference = snapshot.data?.indexWhere(
                (element) =>
                    element.code == reference.code &&
                    element.oficialStore == reference.oficialStore,
              );
              if (indexReference != null && indexReference >= 0) {
                referenceAux = snapshot.data![indexReference];
              }
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ModavestScale(
                  priceTableCode: reference.priceTable ?? 0,
                  products: color.products,
                  prices: (referenceAux.referencePrice?.prices ?? [])
                      .where(
                        (element) => color.products.any(
                          (product) => product.code == element.productCode,
                        ),
                      )
                      .toList(),
                  getScale: getScale,
                ),
              );
            },
          ),
          StreamBuilder(
            stream: referencesStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Reference>> snapshot,
            ) {
              Reference referenceAux = reference;
              final int? indexReference = snapshot.data?.indexWhere(
                (element) =>
                    element.code == reference.code &&
                    element.oficialStore == reference.oficialStore,
              );
              if (indexReference != null && indexReference >= 0) {
                referenceAux = snapshot.data![indexReference];
              }
              getDiscountEvent?.call(referenceAux);
              return CountingItemBag(
                color: color,
                key: tableSizes,
                productStock: productStock,
                disableInputsControls: referenceAux.isPack ?? false,
                productAmount: productAmount,
                onchangeProductAmount: onChangeProductAmount,
                isPack: referenceAux.isPack ?? false,
                prices: referenceAux.referencePrice?.prices ?? [],
                officialStoreCode: referenceAux.oficialStore,
                priceTableCode: referenceAux.priceTable,
                showAmountColor: true,
                buildPriceLabel: buildPriceLabel,
                updatePrices: ({bagOrders, required num quantity}) =>
                    updatePrices?.call(
                        bagOrders: bagOrders,
                        quantity: quantity,
                        referenceAux: referenceAux),
                onAddProduct: onAddProduct,
                onTapOservations: onTapOservations,
              );
            },
          ),
        ],
      ),
    );
  }
}
