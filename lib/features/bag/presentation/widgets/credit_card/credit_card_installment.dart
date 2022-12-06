import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/official_store_installment.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';

class CreditCardInstallment extends StatelessWidget {
  final OfficialStoreInstallment officialStoreInstallment;
  final TextEditingController paymentOptionController;
  final bool readOnly;
  final Function(String?) onChange;
  const CreditCardInstallment(
      {super.key,
      required this.readOnly,
      required this.officialStoreInstallment,
      required this.paymentOptionController,
      required this.onChange});

  Map<String?, String?> buildItens() {
    final Map<String?, String?> items = {};
    for (int i = 1; i <= officialStoreInstallment.instalment; i++) {
      items.putIfAbsent(
          i.toString(),
          () =>
              "$i X ${i > 1 ? officialStoreInstallment.feesShopkeeper ? "COM" : "SEM" : "SEM"} JUROS");
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: ModaVestDropdownField(
        readOnly: readOnly,
        controller: paymentOptionController,
        title: ModaVestLabels.installments,
        items: buildItens(),
        onChange: onChange,
      ),
    );
  }
}
