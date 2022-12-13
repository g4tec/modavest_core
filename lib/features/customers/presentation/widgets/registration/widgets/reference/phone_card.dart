import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class PhoneCard extends StatelessWidget {
  final void Function(LegalPersonPhone) onEdit;
  final LegalPersonPhone phone;
  final bool showEdit;
  const PhoneCard({
    super.key,
    required this.phone,
    required this.onEdit,
    this.showEdit = true,
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
                        EnumParameters.pesTipoTelefone.value.items.indexWhere(
                      (element) => element.variant == phone.typeCode.toString(),
                    );

                    return Flexible(
                      child: ModavestTitle(
                        indexParam >= 0
                            ? (EnumParameters
                                .pesTipoTelefone.value.items[indexParam].value)
                            : "Tipo telefone ${phone.typeCode.toString()}",
                      ),
                    );
                  },
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
                      if (phone.number != null && phone.number!.isNotEmpty)
                        Text("Telefone ${phone.number}"),
                      if (phone.branchLine != null)
                        Text("Ramal ${phone.branchLine}"),
                    ],
                  ),
                ),
                if (showEdit)
                  TextButton(
                    onPressed: () => onEdit.call(phone),
                    child: Text(ModaVestLabels.edit.toUpperCase()),
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
