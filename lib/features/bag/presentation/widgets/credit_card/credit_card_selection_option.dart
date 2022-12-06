import 'package:dartz/dartz.dart' as either;
import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/credit_card_payment_condition.dart';
import 'package:modavest_core/domain/models/official_store_installment.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/credit_card_installment.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/list_credit_cards.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/modavest_credit_card_form.dart';
import 'package:modavest_core/widgets/fields/credit_card_infos.dart';

class CreditCardSelectionOption extends StatefulWidget {
  final Function(CreditCardInfos,
          {Function(either.Either<dynamic, String> either)? closeCallBack})?
      onSubmitCard;
  final Function(CrediCartPaymentCondition? selectedCreditPaymentCondition)
      onSelectCreditPaymentCondition;
  final Function(String?, Function())? onDeleteCard;
  final OfficialStoreInstallment? installment;

  final String? initialCard;

  final List<CreditCardInfos> creditCardsInfos;
  const CreditCardSelectionOption({
    super.key,
    this.onSubmitCard,
    required this.onSelectCreditPaymentCondition,
    required this.creditCardsInfos,
    this.initialCard,
    this.onDeleteCard,
    this.installment,
  });

  @override
  State<CreditCardSelectionOption> createState() =>
      _CreditCardSelectionOptionState();
}

class _CreditCardSelectionOptionState extends State<CreditCardSelectionOption> {
  bool addCard = false;
  bool isSending = false;
  String? cardToken;
  TextEditingController paymentOptionController = TextEditingController();

  @override
  void initState() {
    cardToken = widget.initialCard;
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
                creditCardInfos: widget.creditCardsInfos,
                initialCard: cardToken,
                onAddCard: () => setState(() => addCard = !addCard),
                onCardChange: (token) {
                  paymentOptionController.clear();
                  FocusScope.of(context).unfocus();
                  widget.onSelectCreditPaymentCondition.call(null);
                  setState(() => cardToken = token);
                },
                onDeleteCard: widget.onDeleteCard,
              ),
              if (widget.installment != null)
                CreditCardInstallment(
                  readOnly: cardToken == null,
                  officialStoreInstallment: widget.installment!,
                  paymentOptionController: paymentOptionController,
                  onChange: (condition) {
                    if (condition != null && cardToken != null) {
                      widget.onSelectCreditPaymentCondition
                          .call(CrediCartPaymentCondition(
                        cardToken: cardToken!,
                        installment: condition,
                      ));
                    }
                  },
                ),
            ],
          );
  }
}
