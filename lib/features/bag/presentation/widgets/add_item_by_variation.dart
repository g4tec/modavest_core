import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/features/bag/presentation/widgets/counting_item_bag.dart';
import 'package:modavest_core/widgets/fields/modavest_scale_field.dart';
import 'package:modavest_core/widgets/fields/number_with_controls_input.dart';

class AddItemByVariation extends StatelessWidget {
  final color_entitie.Color color;
  final Reference reference;
  final Map<Product, int?> productAmount;
  final Stream<List<Reference>>? referencesStream;
  final Function(Product, int, num, num, {Function()? callBack})
      onChangeProductAmount;
  final bool streamReferencesIsDoneValue;
  final Function()? getDiscountEvent;
  final Widget Function(ProductPrice?) buildPriceLabel;

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
  });

  final GlobalKey tableSizes = GlobalKey(debugLabel: "tableSizes");

  void onChangeInGlobalInput(int value, int amount) {
    (tableSizes.currentState! as CountingItemBagState).setValueAll(amount);
  }

  void onTypeGlobalInput(int value) {
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
                  style: Theme.of(context).textTheme.bodyText1,
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
                      onChange: onChangeInGlobalInput,
                      controller: TextEditingController(text: "0"),
                      onChangeByTyping: onTypeGlobalInput,
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
              getDiscountEvent?.call();
              return CountingItemBag(
                color: color,
                key: tableSizes,
                disableInputsControls: referenceAux.isPack ?? false,
                productAmount: productAmount,
                onchangeProductAmount: onChangeProductAmount,
                isPack: referenceAux.isPack ?? false,
                prices: referenceAux.referencePrice?.prices ?? [],
                officialStoreCode: referenceAux.oficialStore,
                priceTableCode: referenceAux.priceTable,
                reference: referenceAux,
                showAmountColor: true,
                buildPriceLabel: buildPriceLabel,
              );
            },
          ),
        ],
      ),
    );
  }
}
