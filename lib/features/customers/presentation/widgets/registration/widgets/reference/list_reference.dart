import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/features/customers/presentation/widgets/registration/widgets/reference/reference_card.dart';

class ListReference extends StatelessWidget {
  final List<EnterpriseReference> references;
  final void Function() onAddReference;
  final void Function(EnterpriseReference) onEditreference;
  const ListReference({
    super.key,
    required this.references,
    required this.onAddReference,
    required this.onEditreference,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...references.map(
          (e) => ReferenceCard(
            reference: e,
            onEdit: onEditreference,
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
                        ModaVestLabels.addReference,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    IconButton(
                      onPressed: onAddReference,
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
