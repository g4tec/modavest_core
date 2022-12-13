import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';
import 'package:modavest_core/features/customers/presentation/widgets/registration/widgets/reference/phone_card.dart';

class ListPhone extends StatelessWidget {
  final List<LegalPersonPhone> phones;
  final void Function() onAddPhone;
  final void Function(LegalPersonPhone) onEditPhone;
  const ListPhone({
    super.key,
    required this.phones,
    required this.onAddPhone,
    required this.onEditPhone,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...phones.map(
          (e) => PhoneCard(
            phone: e,
            onEdit: onEditPhone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: DottedBorder(
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
                        ModaVestLabels.addPhone,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    IconButton(
                      onPressed: onAddPhone,
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
          ),
        ),
      ],
    );
  }
}
