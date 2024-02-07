import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';

class OrderActions extends StatelessWidget {
  final Function()? onTapToReturn;
  final Function()? onTapResend;

  const OrderActions({
    super.key,
    required this.onTapToReturn,
    required this.onTapResend,
  });

  Widget buildRow({
    required String title,
    required BuildContext context,
    bool filled = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: filled ? Colors.grey.shade300 : Colors.white30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AutoSizeText(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (onTapToReturn != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ModaVestTextButton(
            title: ModaVestLabels.resendOrder,
            onPressed: onTapResend,
            color: Theme.of(context).primaryColor,
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ModaVestTextButton(
              title: ModaVestLabels.recreateOrder,
              onPressed: onTapToReturn,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      ],
    );
  }
}
