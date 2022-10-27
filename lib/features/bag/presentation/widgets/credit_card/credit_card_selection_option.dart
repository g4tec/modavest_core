import 'package:dartz/dartz.dart' as either;
import 'package:flutter/material.dart';
import 'package:modavest_core/features/bag/presentation/widgets/credit_card/modavest_credit_card_form.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/credit_card_infos.dart';

class CreditCardSelectionOption extends StatefulWidget {
  final Function(CreditCardInfos,
      {Function(either.Either either)? closeCallBack})? onSubmit;
  const CreditCardSelectionOption({super.key, this.onSubmit});

  @override
  State<CreditCardSelectionOption> createState() =>
      _CreditCardSelectionOptionState();
}

class _CreditCardSelectionOptionState extends State<CreditCardSelectionOption> {
  bool addCard = false;
  bool isSending = false;

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
              widget.onSubmit?.call(creditCardInfos, closeCallBack: (either) {
                either.fold(
                  (l) => setState(() => isSending = false),
                  (r) => setState(() {
                    isSending = false;
                    addCard = false;
                  }),
                );
              });
            })
        : ModaVestTextButton(
            title: "Adicionar cartão",
            onPressed: () => setState(() => addCard = !addCard),
          );
  }
}
