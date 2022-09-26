import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class BagTitleWithAction extends StatelessWidget {
  final void Function() onPressedEdit;
  final bool showClose;
  final void Function()? onPressedClose;
  final void Function()? onPressedMove;
  final void Function()? onPressedCopy;
  const BagTitleWithAction({
    super.key,
    required this.onPressedEdit,
    required this.onPressedClose,
    this.onPressedMove,
    this.onPressedCopy,
    this.showClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ModavestTitle(ModaVestLabels.myShoppingBag),
          ),
          Material(
            shape: const CircleBorder(),
            child: showClose
                ? PopupMenuButton<void Function()>(
                    onSelected: (value) {
                      value.call();
                    },
                    icon: Icon(
                      Icons.more_horiz,
                      size: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<void Function()>>[
                      PopupMenuItem(
                        value: onPressedEdit,
                        child: GestureDetector(
                          child: Text(ModaVestLabels.edit),
                        ),
                      ),
                      if (onPressedMove != null)
                        PopupMenuItem(
                          value: onPressedMove,
                          child: GestureDetector(
                            child: Text(ModaVestLabels.moveBag),
                          ),
                        ),
                      if (onPressedCopy != null)
                        PopupMenuItem(
                          value: onPressedCopy,
                          child: GestureDetector(
                            child: Text(ModaVestLabels.copyBag),
                          ),
                        ),
                    ],
                  )
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: onPressedClose,
                    splashRadius: 24,
                    color: Theme.of(context).primaryColor,
                  ),
          )
        ],
      ),
    );
  }
}
