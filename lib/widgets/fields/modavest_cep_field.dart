import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modavest_core/utils/search_cep.dart';
import 'package:modavest_core/utils/validator/cep_validator.dart';
import 'package:search_cep/search_cep.dart';

class ModavestCepField extends StatelessWidget {
  /// Uma função que recebe uma String quando o campo for submetido
  final Function(String?)? onSubmit;
  final TextEditingController controller;
  final String title;
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '#####-###', filter: {"#": RegExp('[0-9]')});
  final TextInputAction textInputAction;
  final void Function(ViaCepInfo?)? onValidateCep;

  ModavestCepField({
    Key? key,
    required this.title,
    required this.controller,
    this.onSubmit,
    this.textInputAction = TextInputAction.next,
    this.onValidateCep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline5,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: onSubmit,
        controller: controller,
        validator: validateCEP,
        onChanged: (String? value) async {
          final res = await searchCep(value);
          if (res != null) {
            onValidateCep?.call(res);
          }
        },
        inputFormatters: [maskFormatter],
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: title,
          labelStyle: Theme.of(context).textTheme.headline5,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
