import 'package:flutter/material.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

class ModaVestDropdownField extends StatefulWidget {
  // Função para callBack do valor do dropDown no evento de OnChange
  final Function(String?)? onChange;

  /// Uma função que retorna uma String se houver um erro,
  /// senão retorna null, para este caso é usado o validator padrão, caso necessário sobrescreve-lo
  final String Function(String?)? validator;
  final TextEditingController controller;
  final String title;

  /// Lista de Strings que aparecem no dropdown
  final Map<String?, String?> items;
  final bool isRequired;
  final bool readOnly;

  const ModaVestDropdownField({
    Key? key,
    required this.controller,
    required this.title,
    required this.items,
    this.onChange,
    this.validator,
    this.isRequired = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<ModaVestDropdownField> createState() => _ModaVestDropdownFieldState();
}

class _ModaVestDropdownFieldState extends State<ModaVestDropdownField> {
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> dropdownItems =
        widget.items.keys.map<DropdownMenuItem<String>>((String? value) {
      return DropdownMenuItem<String>(
        key: Key(value ?? ""),
        value: value,
        child: widget.items[value] != null
            ? Text(
                widget.items[value]!,
                style: const TextStyle(color: Colors.black),
              )
            : const SizedBox(),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          DropdownButtonFormField<String?>(
            isExpanded: true,
            value: widget.controller.value.text.isEmpty
                ? null
                : widget.controller.text,
            style: Theme.of(context).textTheme.bodySmall,
            onChanged: (value) {
              setState(() {
                widget.controller.text = value.toString();
              });
              widget.onChange?.call(value);
            },
            items: dropdownItems,
            validator: (String? value) {
              return defaultValidate(value?.toString(), widget.isRequired);
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              labelText: widget.title,
              labelStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          if (widget.readOnly)
            Positioned.fill(
              child: Container(
                color: Theme.of(context).primaryColor.withAlpha(60),
                width: double.infinity,
              ),
            ),
        ],
      ),
    );
  }
}
