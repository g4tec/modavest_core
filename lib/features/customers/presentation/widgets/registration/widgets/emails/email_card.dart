import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class EmailCard extends StatelessWidget {
  final void Function(LegalPersonEmail) onEdit;
  final LegalPersonEmail email;
  const EmailCard({
    super.key,
    required this.email,
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
                Builder(
                  builder: (context) {
                    final int indexParam =
                        EnumParameters.pesTipoEmail.value.items.indexWhere(
                      (element) => element.variant == email.typeCode.toString(),
                    );

                    return Flexible(
                      child: ModavestTitle(
                        indexParam >= 0
                            ? (EnumParameters
                                .pesTipoEmail.value.items[indexParam].value)
                            : "Tipo Email ${email.typeCode.toString()}",
                      ),
                    );
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (email.email != null) Text(email.email ?? " -- "),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => onEdit.call(email),
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
