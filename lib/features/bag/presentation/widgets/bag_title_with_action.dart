import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class BagTitleWithAction extends StatelessWidget {
  final void Function() onPressed;
  final bool showClose;
  final void Function()? onPressedClose;
  const BagTitleWithAction({
    super.key,
    required this.onPressed,
    required this.onPressedClose,
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
                        value: onPressed,
                        child: GestureDetector(
                          child: Text(ModaVestLabels.edit),
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
