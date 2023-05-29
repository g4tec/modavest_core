import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NumberWithControlsInput extends StatelessWidget {
  final Function(int, int)? onChange;
  final Function(int)? onChangeByTyping;
  final Function(String?)? onSumbit;
  final bool disableControls;
  final int stepSize;
  final int? value;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? maxValue;
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
  });
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '#######', filter: {"#": RegExp('[0-9]')});

  void _onSum() {
    try {
      int value = controller.text.isNotEmpty ? int.parse(controller.text) : 0;
      value += stepSize;

      if (maxValue == null || value <= maxValue!) {
        controller.text = value.toString();
        if (onChange != null) {
          onChange!.call(
            1,
            controller.text.isNotEmpty ? int.parse(controller.text) : 0,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void _onSubtraction() {
    try {
      int value = controller.text.isNotEmpty ? int.parse(controller.text) : 0;
      value -= stepSize;
      if (value >= 0) {
        controller.text = value.toString();
        if (onChange != null) {
          onChange!.call(
            -1,
            controller.text.isNotEmpty ? int.parse(controller.text) : 0,
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

  void setValue(int value) {
    int total = value * stepSize;
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
                color: Theme.of(context).primaryColor,
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
              inputFormatters: [maskFormatter],
              readOnly: disableControls,
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              onFieldSubmitted: onSumbit ??
                  (_) => FocusScope.of(context).requestFocus(FocusNode()),
              onChanged: (String value) {
                int? value = int.tryParse(controller.text);
                if (maxValue != null && (value ?? 0) > maxValue!) {
                  value = maxValue;
                  controller.text = value.toString();
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
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
