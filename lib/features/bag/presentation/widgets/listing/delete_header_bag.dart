import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class DeleteHeaderBag extends StatelessWidget {
  final bool value;
  final Function(bool?) onChange;
  final void Function() onDelete;

  const DeleteHeaderBag({
    super.key,
    required this.value,
    required this.onChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(value: value, onChanged: onChange),
              ),
              GestureDetector(
                onTap: () {
                  onChange.call(!value);
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    ModaVestLabels.selectAll,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.centerRight,
                child: Material(
                  color: Theme.of(context).canvasColor,
                  child: IconButton(
                    splashRadius: 24,
                    icon: Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      onDelete.call();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
