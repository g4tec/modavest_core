import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_images.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavest_cnpj_field.dart';

class ValidateCustomerCnpjWidget extends StatefulWidget {
  final Function() submitForm;
  final bool isLoading;
  final Function() onChangeForm;
  final String? errorMsg;
  final GlobalKey<FormState> formKey;
  const ValidateCustomerCnpjWidget({
    super.key,
    required this.submitForm,
    required this.isLoading,
    required this.onChangeForm,
    required this.errorMsg,
    required this.formKey,
  });

  @override
  ValidateCustomerCnpjWidgetState createState() =>
      ValidateCustomerCnpjWidgetState();
}

class ValidateCustomerCnpjWidgetState
    extends State<ValidateCustomerCnpjWidget> {
  final TextEditingController cnpjController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  40,
                  MediaQuery.of(context).size.height * 0.1,
                  40,
                  20,
                ),
                child: Image.asset(
                  ModaVestImages.horizontalLogo,
                ),
              ),
              Form(
                key: widget.formKey,
                onChanged: widget.onChangeForm,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Text(
                        ModaVestLabels.validateCustomerCnpj,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ModaVestCNPJField(
                      label: ModaVestLabels.customerCNPJ,
                      controller: cnpjController,
                      cnpjOnly: true,
                      maskFormatterCnpjCpf: TextInputMask(
                        mask: ['99.999.999/9999-99'],
                      ),
                      onSubmit: widget.isLoading
                          ? null
                          : (value) {
                              widget.submitForm();
                            },
                    ),
                    if (widget.errorMsg != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.errorMsg!,
                          style:
                              Theme.of(context).inputDecorationTheme.errorStyle,
                        ),
                      ),
                    ModaVestTextButton(
                      title: ModaVestLabels.continueLabel.toUpperCase(),
                      onPressed: widget.submitForm,
                      isLoading: widget.isLoading,
                    ),
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
