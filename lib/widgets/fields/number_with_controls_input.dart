import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NumberWithControlsInput extends StatelessWidget {
  final Function(int, num)? onChange;
  final Function(num)? onChangeByTyping;
  final Function(String?)? onSumbit;
  final bool disableControls;
  final int stepSize;
  final num? value;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? maxValue;
  final bool fractional;
  NumberWithControlsInput({
    super.key,
    this.onChange,
    this.onChangeByTyping,
    this.disableControls = false,
    this.stepSize = 1,
    this.value,
    required this.controller,
    this.textInputAction,
    this.focusNode,
    this.onSumbit,
    this.maxValue,
    this.fractional = false,
  });
  final List<TextInputFormatter> maskFormatterInt = [
    MaskTextInputFormatter(mask: '#######', filter: {"#": RegExp('[0-9]')})
  ];
  final List<TextInputFormatter> maskFormatterFloat = [
    FilteringTextInputFormatter.allow(RegExp(r'^[0-9,]*$')),
    CommaInputFormatter()
  ];

  void _onSum() {
    try {
      num value = controller.text.isNotEmpty
          ? num.parse(controller.text.replaceAll(',', '.'))
          : 0;
      value += stepSize;

      if (maxValue == null || value <= maxValue!) {
        controller.text = value.toString().replaceAll(',', '.');
        if (onChange != null) {
          onChange!.call(
            1,
            controller.text.isNotEmpty
                ? num.parse(controller.text.replaceAll(',', '.'))
                : 0,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void _onSubtraction() {
    try {
      int value = controller.text.isNotEmpty
          ? int.parse(controller.text.replaceAll(',', '.'))
          : 0;
      value -= stepSize;
      if (value >= 0) {
        controller.text = value.toString();
        if (onChange != null) {
          onChange!.call(
            -1,
            controller.text.isNotEmpty
                ? int.parse(controller.text.replaceAll(',', '.'))
                : 0,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void increment() {
    _onSum();
  }

  void decrement() {
    _onSubtraction();
  }

  void setValue(num value) {
    num total = value * stepSize;
    if (maxValue != null && total > maxValue!) {
      total = maxValue!;
    }
    controller.text = total.toString();
    onChangeByTyping?.call(total);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: maxValue != null &&
                        maxValue! <
                            num.parse(controller.text.replaceAll(',', '.'))
                    ? Colors.red
                    : Theme.of(context).primaryColor,
              ),
              width: 32,
              child: disableControls
                  ? const SizedBox()
                  : IconButton(
                      splashRadius: 26,
                      icon: Icon(
                        Icons.remove,
                        size: 16,
                        color: Theme.of(context).canvasColor,
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _onSubtraction();
                      },
                    ),
            ),
          ),
          Expanded(
            child: TextFormField(
              textInputAction: textInputAction ?? TextInputAction.done,
              controller: controller,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              inputFormatters:
                  fractional ? maskFormatterFloat : maskFormatterInt,
              readOnly: disableControls,
              focusNode: focusNode,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: fractional),
              onFieldSubmitted: onSumbit ??
                  (_) => FocusScope.of(context).requestFocus(FocusNode()),
              onChanged: (String value) {
                num? value = num.tryParse(controller.text.replaceAll(',', '.'));
                if (maxValue != null && (value ?? 0) > maxValue!) {
                  value = maxValue;
                  controller.text = value.toString().replaceAll('.', ',');
                }
                if (onChangeByTyping != null) {
                  try {
                    onChangeByTyping!.call(
                      value ?? 0,
                    );
                  } catch (e) {
                    rethrow;
                  }
                }
                if (onChange != null) {
                  onChange!.call(
                    0,
                    value ?? 0,
                  );
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: maxValue != null &&
                            maxValue! <
                                num.parse(controller.text.replaceAll(',', '.'))
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: maxValue != null &&
                            maxValue! <
                                num.parse(controller.text.replaceAll(',', '.'))
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: maxValue != null &&
                        maxValue! <
                            num.parse(controller.text.replaceAll(',', '.'))
                    ? Colors.red
                    : Theme.of(context).primaryColor,
              ),
              width: 32,
              child: disableControls
                  ? const SizedBox()
                  : IconButton(
                      splashRadius: 26,
                      icon: Icon(
                        Icons.add,
                        size: 16,
                        color: Theme.of(context).canvasColor,
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _onSum();
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Count the commas in the current text
    int commaCount = newValue.text.split(',').length - 1;

    // Allow the update only if there is one or zero commas
    if (commaCount > 1) {
      return oldValue;
    }

    return newValue;
  }
}
