import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/payment_options.dart';

class PaymentOptionCard extends StatelessWidget {
  final void Function() onSelect;
  final PaymentOptions paymentOption;
  final int selected;
  const PaymentOptionCard({
    super.key,
    required this.onSelect,
    required this.paymentOption,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = paymentOption.id == selected;
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(10),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor),
          color: isSelected ? Theme.of(context).primaryColor : null,
        ),
        child: FittedBox(
          child: Column(
            children: [
              Icon(
                paymentOption.icon,
                color:
                    isSelected ? Colors.white : Theme.of(context).primaryColor,
              ),
              Text(
                paymentOption.name,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: isSelected ? Colors.white : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
