import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class EmptyList extends StatelessWidget {
  final String? title;
  final bool blackForegraund;
  const EmptyList({
    Key? key,
    this.title,
    this.blackForegraund = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inventory_2,
            color: blackForegraund ? Colors.white : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            child: Text(
              title ?? ModaVestLabels.emptyProducts,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: blackForegraund ? Colors.white : null),
            ),
          ),
        ],
      ),
    );
  }
}
