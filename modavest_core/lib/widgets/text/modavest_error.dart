import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class ModavestError extends StatelessWidget {
  final String? msg;
  final void Function()? onPress;
  final Color? textColor;
  const ModavestError({Key? key, this.msg, this.onPress, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              msg ?? ModaVestLabels.serverError,
              style: TextStyle(color: textColor),
            ),
            IconButton(
              onPressed: onPress,
              icon: const Icon(Icons.replay_outlined),
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
