import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/utils/validator/cpf_validator.dart';

class ModaVestCPFField extends StatelessWidget {
  final String? Function()? onError;
  final Function(String?)? onSubmit;
  final TextEditingController controller;
  final TextInputMask _maskFormatterCpf = TextInputMask(
    mask: ['999.999.999-99'],
  );
  final TextInputMask? maskFormatterCpf;
  final bool readOnly;
  final TextInputAction textInputAction;
  final String? label;

  ModaVestCPFField({
    Key? key,
    required this.controller,
    this.onError,
    this.onSubmit,
    this.textInputAction = TextInputAction.send,
    this.maskFormatterCpf,
    this.readOnly = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline5,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        onFieldSubmitted: onSubmit,
        controller: controller,
        readOnly: readOnly,
        validator: validateCPF,
        inputFormatters: [maskFormatterCpf ?? _maskFormatterCpf],
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: label ?? ModaVestLabels.requiredCpff,
          labelStyle: Theme.of(context).textTheme.headline5,
          hintStyle: Theme.of(context).textTheme.headline5,
          errorText: onError?.call(),
        ),
      ),
    );
  }
}
