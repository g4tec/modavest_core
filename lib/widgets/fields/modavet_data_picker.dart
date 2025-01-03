import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

class ModaVestDataPickerField extends StatefulWidget {
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

  const ModaVestDataPickerField({
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
  State<ModaVestDataPickerField> createState() =>
      _ModaVestDataPickerFieldState();
}

class _ModaVestDataPickerFieldState extends State<ModaVestDataPickerField> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        widget.controller.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          TextFormField(
            onTap: () {
              if (!widget.readOnly) _selectDate(context);
            },
            style: Theme.of(context).textTheme.headline5,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.maskFormatter,
            readOnly: true,
            maxLength: widget.maxLength,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            validator: (String? value) =>
                widget.validator?.call(value, widget.isRequired),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              counterText: "",
              labelText: '${widget.title} ${widget.isRequired ? ' *' : ''}',
              labelStyle: Theme.of(context).textTheme.headline5,
              hintStyle: Theme.of(context).textTheme.headline5,
            ),
          ),
          if (widget.readOnly)
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
