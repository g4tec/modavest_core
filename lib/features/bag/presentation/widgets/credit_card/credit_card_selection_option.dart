import 'package:dartz/dartz.dart' as either;
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/credit_card_payment_condition.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/list_credit_cards.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/modavest_credit_card_form.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/credit_card_infos.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';

class CreditCardSelectionOption extends StatefulWidget {
  final Function(CreditCardInfos,
          {Function(either.Either<dynamic, String> either)? closeCallBack})?
      onSubmitCard;
  final Function(CrediCartPaymentCondition? selectedCreditPaymentCondition)
      onSelectCreditPaymentCondition;
  const CreditCardSelectionOption(
      {super.key,
      this.onSubmitCard,
      required this.onSelectCreditPaymentCondition});

  @override
  State<CreditCardSelectionOption> createState() =>
      _CreditCardSelectionOptionState();
}

class _CreditCardSelectionOptionState extends State<CreditCardSelectionOption> {
  bool addCard = false;
  bool isSending = false;
  late String cardToken;
  TextEditingController paymentOptionController = TextEditingController();
  final List<CreditCardInfos> creditCardInfos = [
    CreditCardInfos(
        holderName: "Jailson L Panizzon",
        expirationMonth: "12",
        expirationYear: "25",
        cardNumber: "4539********7497",
        securityCode: "***",
        token: "3eae481d6ee44c228d1086cca1d97be1"),
    CreditCardInfos(
        holderName: "Leandro Araujo",
        expirationMonth: "12",
        expirationYear: "25",
        cardNumber: "5138692036125449",
        securityCode: "***",
        token: "e1b1f50e870b4ba09dcebe849dfe82b0"),
    CreditCardInfos(
        holderName: "Luizão Smith",
        expirationMonth: "12",
        expirationYear: "25",
        cardNumber: "4532650104137832",
        securityCode: "***",
        token: "11a0b6973ca64e5b984dcd8549193a32"),
  ];

  @override
  void initState() {
    cardToken = creditCardInfos.first.token!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return addCard
        ? ModavestCreditCardForm(
            isSending: isSending,
            onCancel: () => setState(() => addCard = !addCard),
            onSubmit: (creditCardInfos) {
              setState(() {
                isSending = true;
              });
              widget.onSubmitCard?.call(creditCardInfos,
                  closeCallBack: (either) {
                either.fold(
                  (l) => setState(() => isSending = false),
                  (r) => setState(() {
                    isSending = false;
                    addCard = false;
                    cardToken = r;
                  }),
                );
              });
            })
        : Column(
            children: [
              ListCreditCards(
                creditCardInfos: creditCardInfos,
                initialCard: cardToken,
                onCardChange: (cardToken) {
                  paymentOptionController.clear();
                  FocusScope.of(context).unfocus();
                  setState(() => cardToken = cardToken);
                  widget.onSelectCreditPaymentCondition.call(null);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 0, right: 32),
                child: ModaVestTextButton(
                  title: ModaVestLabels.addCreditCard,
                  onPressed: () => setState(() => addCard = !addCard),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: ModaVestDropdownField(
                  controller: paymentOptionController,
                  title: ModaVestLabels.installments,
                  items: const {
                    "1": "  A vista",
                    "2": "  1X com juros",
                    "3": "  2X com juros",
                    "4": "  3X com juros",
                  },
                  onChange: (condition) {
                    if (condition != null) {
                      widget.onSelectCreditPaymentCondition
                          .call(CrediCartPaymentCondition(
                        cardToken: cardToken,
                        installment: condition,
                      ));
                    }
                  },
                ),
              )
            ],
          );
  }
}
