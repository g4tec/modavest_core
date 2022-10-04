import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

class ModaVestTextField extends StatelessWidget {
  /// Uma função que retorna uma String se houver um erro,
  /// senão retorna null, para este caso é usado o validator padrão, caso necessário sobrescreve-lo
  final String? Function(String?, bool?)? validator;
  final TextEditingController controller;
  final String title;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputMask>? maskFormatter;
  final bool isRequired;

  const ModaVestTextField({
    Key? key,
    required this.controller,
    required this.title,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.validator = defaultValidate,
    this.readOnly = false,
    this.maskFormatter,
    this.maxLength,
    this.isRequired = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            keyboardType: keyboardType,
            inputFormatters: maskFormatter,
            readOnly: readOnly,
            maxLength: maxLength,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            controller: controller,
            validator: (String? value) => validator?.call(value, isRequired),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              counterText: "",
              labelText: '$title ${isRequired ? ' *' : ''}',
              labelStyle: Theme.of(context).textTheme.headline5,
              hintStyle: Theme.of(context).textTheme.headline5,
            ),
          ),
          if (readOnly)
            Container(
              color: Theme.of(context).primaryColor.withAlpha(60),
              width: double.infinity,
              height: 59,
            ),
        ],
      ),
    );
  }
}
