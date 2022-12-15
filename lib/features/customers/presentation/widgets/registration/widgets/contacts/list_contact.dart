import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';
import 'package:modavest_core/features/customers/presentation/widgets/registration/widgets/contacts/contact_card.dart';

class ListContacts extends StatelessWidget {
  final List<LegalPersonContact> contacts;
  final void Function() onAddContact;
  final void Function(LegalPersonContact) onEditContact;
  const ListContacts({
    super.key,
    required this.contacts,
    required this.onAddContact,
    required this.onEditContact,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...contacts.map(
          (e) => ContactCard(
            contact: e,
            onEdit: onEditContact,
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
                        ModaVestLabels.addContact,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    IconButton(
                      onPressed: onAddContact,
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
