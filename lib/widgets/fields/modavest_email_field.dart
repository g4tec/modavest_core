import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/utils/validator/email_validator.dart';

class ModavestEmailField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? error;
  final String? title;
  final bool readOnly;
  final int? maxLength;
  final bool isRequired;
  const ModavestEmailField({
    Key? key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.error,
    this.title,
    this.readOnly = false,
    this.maxLength,
    this.isRequired = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLength: maxLength,
        style: Theme.of(context).textTheme.headline5,
        keyboardType: TextInputType.emailAddress,
        textInputAction: textInputAction,
        readOnly: readOnly,
        controller: controller,
        validator: (value) {
          if (!isRequired && (value == null || value.isEmpty)) {
            return null;
          } else {
            if (!validateEmail(value!)) {
              return ModaVestLabels.invalidEmail;
            }
            return error;
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          errorText: error,
          labelText: title ?? ModaVestLabels.requiredAcessEmail,
          labelStyle: Theme.of(context).textTheme.headline5,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
