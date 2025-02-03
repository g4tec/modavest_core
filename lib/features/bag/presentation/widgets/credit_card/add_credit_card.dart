import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';

class AddCreditCardWidget extends StatelessWidget {
  final Function()? onAdd;
  const AddCreditCardWidget({super.key, this.onAdd});

  @override
  Widget build(BuildContext context) {
    double horizontalMargin = 20;

    double cardWidth =
        MediaQuery.of(context).size.width - (2 * horizontalMargin);
    double cardHeight = (cardWidth / 2) + 24;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      width: cardWidth,
      height: cardHeight,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 12.0,
            spreadRadius: 0.2,
            offset: Offset(
              3.0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CardBackgrounds.custom(Theme.of(context).colorScheme.primary.value),
            GestureDetector(
              onTap: onAdd,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 42,
                  ),
                  Text(
                    ModaVestLabels.addCreditCard,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
