import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/utils/validator/cnpj_cpf_validator.dart';
import 'package:modavest_core/utils/validator/cnpj_validator.dart';

class ModaVestCNPJField extends StatelessWidget {
  final String? Function()? onError;
  final Function(String?)? onSubmit;
  final TextEditingController controller;
  final TextInputMask _maskFormatterCnpjCpf = TextInputMask(
    mask: ['99.999.999/9999-99', '999.999.999-99'],
  );
  final TextInputMask? maskFormatterCnpjCpf;
  final bool cnpjOnly;
  final bool readOnly;
  final TextInputAction textInputAction;
  final String? label;

  ModaVestCNPJField({
    Key? key,
    required this.controller,
    this.onError,
    this.onSubmit,
    this.textInputAction = TextInputAction.send,
    this.maskFormatterCnpjCpf,
    this.cnpjOnly = false,
    this.readOnly = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        onFieldSubmitted: onSubmit,
        controller: controller,
        readOnly: readOnly,
        validator: cnpjOnly ? validateCNPJ : validateCNPJorCPF,
        inputFormatters: [maskFormatterCnpjCpf ?? _maskFormatterCnpjCpf],
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: label ?? ModaVestLabels.requiredCnpj,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          errorText: onError?.call(),
        ),
      ),
    );
  }
}
