import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/domain/models/details.dart';
import 'package:modavest_core/domain/models/official_store.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/features/products/presentation/widgets/products/details/composition_product.dart';
import 'package:modavest_core/features/products/presentation/widgets/products/details/rating_product.dart';
import 'package:modavest_core/utils/format_sizes.dart';
import 'package:modavest_core/widgets/fields/modavest_discount_field.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class SpecicificationsProduct extends StatelessWidget {
  final Reference reference;
  static const double spacing = 3;
  // TODO: remover para aparecer o ratting e passar os valores de referencia
  final bool ratting;
  final OficialStore? oficialStore;
  const SpecicificationsProduct({
    Key? key,
    required this.reference,
    this.oficialStore,
    this.ratting = false,
  }) : super(key: key);

  List<Widget> buildComposition(BuildContext context) {
    if (reference.composition != null && reference.composition!.isNotEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing),
          child: CompositionProduct(
            compositions: reference.composition!,
          ),
        )
      ];
    }
    return [];
  }

  List<Widget> buildDetails(
    BuildContext context, {
    required List<Detail> details,
  }) {
    final List<Widget> detailsWidgets = [];

    for (final Detail detail in details) {
      detailsWidgets.add(
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: spacing, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detail.title ?? "",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              Text(
                detail.description ?? "",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      );
    }

    return detailsWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final List<Detail>? referenceDetails = reference.details;
    final num price = reference.referencePrice?.min ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          ModavestTitle("${reference.code} - ${reference.name ?? ""}"),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: spacing),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${ModaVestLabels.ref}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(text: reference.code),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: spacing),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${ModaVestLabels.description}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(text: reference.description),
                            ],
                          ),
                        ),
                      ),
                      if (reference.descriptive != null)
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: spacing),
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(text: reference.descriptive),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: spacing),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${ModaVestLabels.sizes}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(
                                text: formatListStringToDisplay(
                                  reference.grid!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: spacing),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${ModaVestLabels.priceTable}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(text: reference.priceTable.toString()),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: spacing),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${ModaVestLabels.officialStore}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(
                                  text: oficialStore?.description ??
                                      reference.oficialStore?.toString() ??
                                      " - "),
                            ],
                          ),
                        ),
                      ),
                      ...buildComposition(context),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ModavestDiscountPrice(
                        spacing: spacing,
                        price: price.toDouble(),
                        oficialStoreId: reference.oficialStore ?? 0,
                        priceTable: reference.priceTable ?? 0,
                      ),
                      if (ratting)
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: spacing),
                          child: FittedBox(
                            child: RatingProduct(
                              ratting: reference.gridCode!.toDouble(),
                              totalRatting: reference.gridCode,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (referenceDetails != null)
            ...detailsType.keys.map((e) {
              final Iterable<Detail> datails = referenceDetails
                  .where((element) => element.type?.toString() == e);

              if (datails.toList().isEmpty) {
                return const SizedBox();
              }

              return ExpansionTile(
                title: Text(detailsType[e] ?? ""),
                tilePadding: const EdgeInsets.symmetric(horizontal: 5),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                children: [
                  ...buildDetails(
                    context,
                    details: datails.toList(),
                  ),
                ],
              );
            })
        ],
      ),
    );
  }
}
