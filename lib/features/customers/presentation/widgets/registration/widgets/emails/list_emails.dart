import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/features/customers/presentation/widgets/registration/widgets/emails/email_card.dart';

class ListEmail extends StatelessWidget {
  final List<LegalPersonEmail> emails;
  final void Function() onAddEmail;
  final void Function(LegalPersonEmail) onEditEmail;
  const ListEmail({
    super.key,
    required this.emails,
    required this.onAddEmail,
    required this.onEditEmail,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...emails.map(
          (e) => EmailCard(
            email: e,
            onEdit: onEditEmail,
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
                        ModaVestLabels.addEmail,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    IconButton(
                      onPressed: onAddEmail,
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
