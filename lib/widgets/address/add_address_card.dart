import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class AddAddressCard extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  const AddAddressCard({Key? key, this.onPressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DottedBorder(
        color: Theme.of(context).primaryColor,
        dashPattern: const [8, 4],
        strokeWidth: 2,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title ?? ModaVestLabels.addDeliveryAddres,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 100,
                child: IconButton(
                  onPressed: onPressed,
                  iconSize: 42,
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColor,
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
