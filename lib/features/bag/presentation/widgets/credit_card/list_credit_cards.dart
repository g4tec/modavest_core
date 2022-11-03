import 'package:awesome_card/awesome_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/add_credit_card.dart';
import 'package:modavest_core/widgets/fields/credit_card_infos.dart';
import 'package:modavest_core/widgets/loading/sending_loading.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

class ListCreditCards extends StatefulWidget {
  final Function(String? cardToken)? onCardChange;
  final Function()? onAddCard;
  final Function(String?, Function())? onDeleteCard;
  final List<CreditCardInfos> creditCardInfos;
  final String? initialCard;
  const ListCreditCards({
    super.key,
    required this.creditCardInfos,
    required this.initialCard,
    this.onCardChange,
    this.onAddCard,
    this.onDeleteCard,
  });

  @override
  State<ListCreditCards> createState() => _ListCreditCardsState();
}

class _ListCreditCardsState extends State<ListCreditCards> {
  CarouselController carouselController = CarouselController();
  String? deletingCard;
  @override
  Widget build(BuildContext context) {
    List<Widget> creditCards = [
      FittedBox(
        child: AddCreditCardWidget(
          onAdd: widget.onAddCard,
        ),
      )
    ];

    creditCards.addAll(widget.creditCardInfos.map((e) {
      String numberTokenColor =
          e.token?.replaceAll(RegExp("[^0-9]"), "") ?? "65";

      int sumNumberColor = 120;
      for (final c in numberTokenColor.characters) {
        sumNumberColor += int.parse(c);
      }

      return FittedBox(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 16),
              child: CreditCard(
                cardNumber: e.cardNumber,
                cardExpiry: '${e.expirationMonth}/${e.expirationYear}',
                cardHolderName: e.holderName,
                cvv: "***",
                showBackSide: false,
                textExpDate: ModaVestLabels.expiry,
                frontBackground: CardBackgrounds.custom(
                    randomColorScheme(seed: sumNumberColor).primary.value),
                backBackground: CardBackgrounds.custom(
                    randomColorScheme(seed: sumNumberColor).primary.value),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360.0),
                child: Container(
                  color: Theme.of(context).errorColor,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    focusColor: Theme.of(context).errorColor,
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() => deletingCard = e.token);
                      widget.onDeleteCard?.call(
                        e.token,
                        () => setState(
                          () => deletingCard = null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (deletingCard == e.token)
              Positioned.fill(
                child: Material(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: SendingLoading(
                      title: ModaVestLabels.deletingCard,
                      blackForegraund: true,
                    )),
              ),
          ],
        ),
      );
    }).toList());

    return CarouselSlider(
      carouselController: carouselController,
      items: creditCards,
      options: CarouselOptions(
        aspectRatio: 15 / 7,
        initialPage: widget.initialCard != null
            ? widget.creditCardInfos
                .indexWhere((element) => element.token == widget.initialCard)
            : 0,
        reverse: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          if (index == 0) {
            widget.onCardChange?.call(null);
          } else {
            widget.onCardChange?.call(widget.creditCardInfos[index - 1].token);
          }
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
