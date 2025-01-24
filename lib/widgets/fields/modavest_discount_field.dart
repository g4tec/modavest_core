import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/widgets/text/modavest_money_bold_text.dart';

class ModavestDiscountPrice extends StatelessWidget {
  final num priceTable;
  final double price;
  final num oficialStoreId;
  final double spacing;
  const ModavestDiscountPrice({
    Key? key,
    required this.priceTable,
    required this.price,
    required this.oficialStoreId,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: AutoSizeText(
                "A partir de",
                minFontSize: 1,
                maxFontSize: 13,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: ModavestMoneyBoldText(
                originalValue: price,
              ),
            ),
          ],
        );
      },
    );
  }
}
