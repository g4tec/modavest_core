import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class ReferenceCard extends StatelessWidget {
  final void Function(EnterpriseReference) onEdit;
  final EnterpriseReference reference;
  const ReferenceCard({
    super.key,
    required this.reference,
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
                  child: ModavestTitle(
                    reference.name ?? reference.description ?? "",
                  ),
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
                      if (reference.name != null && reference.name!.isNotEmpty)
                        Text("Nome ${reference.name}"),
                      if (reference.description != null &&
                          reference.description!.isNotEmpty &&
                          reference.name != null)
                        Text("${reference.description}"),
                      if (reference.phoneNumber != null &&
                          reference.phoneNumber!.isNotEmpty)
                        Text("Celular ${reference.phoneNumber}"),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => onEdit.call(reference),
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
