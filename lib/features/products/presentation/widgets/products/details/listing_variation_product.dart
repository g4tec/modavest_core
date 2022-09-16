import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/color.dart';
import 'package:modavest_core/features/products/presentation/widgets/products/details/variation_product.dart';

class ListingVariationProduct extends StatelessWidget {
  final List<Color> colors;
  final int selected;
  final void Function(int) onChange;
  const ListingVariationProduct({
    Key? key,
    this.colors = const [],
    required this.selected,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 110,
            padding: const EdgeInsets.all(10),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    colors
                        .asMap()
                        .map(
                          (key, color) => MapEntry(
                            key,
                            VariationProduct(
                              color: color,
                              isSelected: key == selected,
                              onTap: () {
                                onChange.call(key);
                              },
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
