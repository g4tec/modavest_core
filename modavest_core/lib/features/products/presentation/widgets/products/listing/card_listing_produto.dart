import 'package:flutter/material.dart';
import 'package:modavest_core/widgets/fields/modavest_discount_field.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

class CardListingProduct extends StatelessWidget {
  final String? imagemUrl;
  final String title;
  final double price;
  final String id;
  final num priceTable;
  final num oficialStoreId;
  final void Function()? onPressed;
  const CardListingProduct({
    Key? key,
    required this.imagemUrl,
    required this.price,
    required this.id,
    required this.title,
    this.onPressed,
    required this.oficialStoreId,
    required this.priceTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        key: Key(id),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ImageColorReferenceView(
                        urlImg: imagemUrl,
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.1,
                            0.2,
                            0.8,
                            0.9,
                          ],
                          colors: [
                            Colors.black12,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                    // TODO: Favoritar
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Material(
                    //     type: MaterialType.circle,
                    //     shadowColor: Colors.transparent,
                    //     color: Colors.transparent,
                    //     elevation: 1,
                    //     child: IconButton(
                    //       onPressed: () {},
                    //       splashColor: Theme.of(context).primaryColorLight,
                    //       splashRadius: 24,
                    //       icon: const Icon(
                    //         Icons.favorite_outline,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          title,
                          minFontSize: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ModavestDiscountPrice(
                              priceTable: priceTable,
                              price: price,
                              oficialStoreId: oficialStoreId,
                              spacing: 0,
                            ),
                          ],
                        ),
                      ),
                    )
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
