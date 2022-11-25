import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class DottedAddCard extends StatelessWidget {
  final String? title;
  final void Function()? onAdd;
  const DottedAddCard({super.key, this.title, this.onAdd});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).primaryColor,
      dashPattern: const [8, 4],
      strokeWidth: 2,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title ?? ModaVestLabels.add,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              IconButton(
                onPressed: onAdd,
                iconSize: 42,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
