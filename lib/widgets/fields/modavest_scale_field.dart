import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/price_table_scales.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_price.dart';

class ModavestScale extends StatelessWidget {
  final num priceTableCode;
  final List<Product> products;
  final List<ProductPrice> prices;
  final Future<List<PriceTableScales>?>? getScale;

  const ModavestScale({
    super.key,
    required this.priceTableCode,
    required this.products,
    required this.prices,
    this.getScale,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getScale,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PriceTableScales>?> snapshot,
      ) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final List<Widget> itensExpanded = [];
          final List<Widget> itens = [];

          late String paramType;
          final String param = snapshot.data?.first.param ?? "3";
          if (param == "3") {
            paramType = "produtos";
          } else if (param == "2") {
            paramType = "cores";
          } else if (param == "1") {
            paramType = "referências";
          } else if (param == "0") {
            paramType = "itens do pedido";
          }

          final List<Widget> scalesWidgets = [];
          for (final PriceTableScales scale in snapshot.data ?? []) {
            if (prices.any((element) => element.scaleCode == scale.scaleCode)) {
              final List<String> values = products
                  .where(
                    (prod) => prices.any(
                      (price) =>
                          price.scaleCode == scale.scaleCode &&
                          price.productCode == prod.code,
                    ),
                  )
                  .map((e) => e.size ?? "")
                  .toList();
              for (int i = 0; i < scale.scales.length; i++) {
                final String discountString =
                    scale.scales[i].variationValue != null &&
                            scale.scales[i].variationValue! != 0
                        ? "R\$${scale.scales[i].variationValue ?? 0}"
                        : "${scale.scales[i].variationPercentage!}%";
                late String text;
                // TODO: ver a questão do máximo de desconto
                // if (i + 1 >= scale.scales.length) {
                //   text =
                //       "A partir de\n${(scale.scales[i - 1].quantity ?? 0) + 1} $paramType";
                // } else {
                text =
                    "$discountString em até\n${scale.scales[i].quantity} $paramType";
                // }
                itens.add(
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    height: 30,
                    color: i.isOdd
                        ? Theme.of(context).primaryColor.withAlpha(20)
                        : Theme.of(context).primaryColor.withAlpha(70),
                    child: Center(
                      child: AutoSizeText(
                        "${scale.scales[i].quantity}|$discountString",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 5,
                      ),
                    ),
                  ),
                );
                itensExpanded.add(
                  Container(
                    width: 100,
                    height: 50,
                    color: i.isOdd
                        ? Theme.of(context).primaryColor.withAlpha(20)
                        : Theme.of(context).primaryColor.withAlpha(70),
                    child: Center(
                      child: AutoSizeText(
                        text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
              scalesWidgets.add(
                ConfigurableExpansionTile(
                  headerExpanded: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.transparent,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 84,
                                child: Text(
                                  "Escala de $paramType para os tamanhos ${values.join(', ')}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_up)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: itensExpanded,
                        ),
                      ),
                    ],
                  ),
                  header: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.transparent,
                              ),
                              Text(
                                "Escala de $paramType",
                                textAlign: TextAlign.center,
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: itens,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
          return Column(
            children: scalesWidgets,
          );
        }
        return const SizedBox();
      },
    );
  }
}
