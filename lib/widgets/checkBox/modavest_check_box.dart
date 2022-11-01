import 'package:flutter/material.dart';

class ModavestCheckBox extends StatelessWidget {
  final bool value;
  final void Function() onSelect;

  const ModavestCheckBox({
    super.key,
    required this.onSelect,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        color: Theme.of(context).canvasColor,
        child: SizedBox(
          height: 16,
          width: 16,
          child: Checkbox(
            value: value,
            fillColor: MaterialStateColor.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xff4d0c70);
                }
                return Colors.white;
              },
            ),
            onChanged: (value) {
              onSelect.call();
            },
          ),
        ),
      ),
    );
  }
}
