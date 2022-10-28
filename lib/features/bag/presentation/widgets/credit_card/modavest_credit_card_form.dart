import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/loading/sending_loading.dart';
import 'package:modavest_core/widgets/fields/credit_card_infos.dart';

class ModavestCreditCardForm extends StatefulWidget {
  final Function(CreditCardInfos)? onSubmit;
  final Function()? onCancel;
  final bool isSending;
  const ModavestCreditCardForm(
      {super.key, this.onSubmit, this.onCancel, this.isSending = false});

  @override
  State<ModavestCreditCardForm> createState() => _ModavestCreditCardFormState();
}

class _ModavestCreditCardFormState extends State<ModavestCreditCardForm> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool _obscureCvv = true;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cnpjCpfController = TextEditingController();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var decoration = InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      counterText: "",
      labelStyle: Theme.of(context).textTheme.headline5,
      hintStyle: Theme.of(context).textTheme.headline5,
      focusColor: Theme.of(context).primaryColor,
      hoverColor: Theme.of(context).primaryColor,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
    );

    return Stack(
      children: [
        Column(
          children: <Widget>[
            Transform.scale(
              scale: 0.75,
              child: CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvvCode,
                showBackSide: isCvvFocused,
                textName: ModaVestLabels.holdName,
                textExpDate: ModaVestLabels.expiry,
                backTextColor: Colors.white,
                frontBackground: CardBackgrounds.custom(
                    Theme.of(context).colorScheme.primary.value),
                backBackground: CardBackgrounds.custom(
                    Theme.of(context).colorScheme.primary.value),
              ),
            ),
            Column(
              children: <Widget>[
                CreditCardForm(
                  formKey: formKey,
                  obscureCvv: _obscureCvv,
                  obscureNumber: false,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvValidationMessage: "Insira o CVV",
                  numberValidationMessage: "Insira o número do cartão",
                  dateValidationMessage: "Insira uma data válida",
                  themeColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.headline5?.color ??
                      Colors.black,
                  cardNumberDecoration:
                      decoration.copyWith(labelText: ModaVestLabels.cardNumber),
                  expiryDateDecoration:
                      decoration.copyWith(labelText: ModaVestLabels.expiry),
                  cvvCodeDecoration: decoration.copyWith(
                    labelText: "CVC",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureCvv ? Icons.visibility_off : Icons.visibility,
                        color: _obscureCvv
                            ? Theme.of(context).unselectedWidgetColor
                            : Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureCvv = !_obscureCvv;
                        });
                      },
                    ),
                  ),
                  cardHolderDecoration:
                      decoration.copyWith(labelText: ModaVestLabels.holdName),
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Column(
                    children: [
                      ModaVestTextButton(
                        title: ModaVestLabels.add,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final CreditCardInfos creditCardInfos =
                                CreditCardInfos(
                              cardNumber: cardNumber,
                              expirationYear: '20${expiryDate.split('/').last}',
                              expirationMonth: expiryDate.split('/').first,
                              holderName: cardHolderName,
                              securityCode: cvvCode,
                            );
                            widget.onSubmit?.call(creditCardInfos);
                          }
                        },
                      ),
                      if (widget.onCancel != null)
                        ModaVestTextButton(
                          title: ModaVestLabels.cancelLabel,
                          outlined: true,
                          onPressed: widget.onCancel,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        if (widget.isSending)
          Positioned.fill(
            child: Material(
                color: Theme.of(context).primaryColor.withOpacity(0.9),
                child: SendingLoading(
                  title: ModaVestLabels.addingCreditCard,
                  blackForegraund: true,
                )),
          ),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
