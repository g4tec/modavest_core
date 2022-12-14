import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class ContactCard extends StatelessWidget {
  final void Function(LegalPersonContact) onEdit;
  final LegalPersonContact contact;
  const ContactCard({
    super.key,
    required this.contact,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ModavestTitle(contact.name),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (contact.phoneNumber != null &&
                          contact.phoneNumber!.isNotEmpty)
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.phone),
                            ),
                            Text(contact.phoneNumber!),
                          ],
                        ),
                      if (contact.cellNumber != null &&
                          contact.cellNumber!.isNotEmpty)
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.smartphone),
                            ),
                            Text(contact.cellNumber!),
                          ],
                        ),
                      if (contact.email != null && contact.email!.isNotEmpty)
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.mail),
                            ),
                            Text(
                              contact.email!,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => onEdit.call(contact),
                  child: Text(ModaVestLabels.edit.toUpperCase()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
