import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

class ModaVestTelefoneField extends StatelessWidget {
  /// Uma função que retorna uma String se houver um erro,
  /// senão retorna null, para este caso é usado o validator padrão, caso necessário sobrescreve-lo
  final String? Function(String?, bool?)? validator;
  final TextEditingController controller;
  final String title;

  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '(##)# ####-####',
    filter: {"#": RegExp('[0-9]')},
  );
  final TextInputAction textInputAction;
  final bool isRequired;

  ModaVestTelefoneField({
    Key? key,
    required this.title,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.validator = defaultValidate,
    this.isRequired = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall,
        keyboardType: TextInputType.number,
        textInputAction: textInputAction,
        controller: controller,
        validator: (String? value) => validator?.call(value, isRequired),
        inputFormatters: [maskFormatter],
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: title,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          hintStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
