import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';

class OrderError extends StatelessWidget {
  final dynamic stackTrace;
  final Function()? onTapToReturn;
  const OrderError({
    super.key,
    required this.stackTrace,
    required this.onTapToReturn,
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
              style: Theme.of(context).textTheme.bodySmall,
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
        ...stackTrace is List
            ? (stackTrace as List)
                .asMap()
                .map(
                  (index, e) => MapEntry(
                    index,
                    buildRow(
                      title: (e as Map)["message"]
                              ?.toString()
                              .replaceAll("  ", "") ??
                          "",
                      context: context,
                      filled: index.isEven,
                    ),
                  ),
                )
                .values
                .toList()
            : [Text(stackTrace.toString())],
        if (onTapToReturn != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ModaVestTextButton(
              title: ModaVestLabels.returnOrderToBag,
              onPressed: onTapToReturn,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      ],
    );
  }
}
