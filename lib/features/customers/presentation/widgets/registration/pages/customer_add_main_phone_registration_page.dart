import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavest_phone_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';
import 'package:modavest_core/widgets/parameter/parameter_dropdown.dart';

class CustomerAddMainPhoneRegistrationPage extends StatefulWidget {
  final void Function(LegalPersonPhone) onAdd;
  final LegalPersonPhone? phoneInitial;
  final void Function(num) onRemove;
  final num sequence;
  final List<LegalPersonPhone> alredyAddedPhones;
  final bool isEdit;

  const CustomerAddMainPhoneRegistrationPage({
    super.key,
    required this.onAdd,
    required this.phoneInitial,
    required this.onRemove,
    required this.sequence,
    this.alredyAddedPhones = const [],
    this.isEdit = false,
  });

  @override
  CustomerAddMainPhoneRegistrationPageState createState() =>
      CustomerAddMainPhoneRegistrationPageState();
}

class CustomerAddMainPhoneRegistrationPageState
    extends State<CustomerAddMainPhoneRegistrationPage> {
  final GlobalKey<FormState> textFieldFormKey = GlobalKey<FormState>();
  late TextEditingController numberController;
  late TextEditingController branchLineController;
  late TextEditingController phoneTypeController;

  @override
  void initState() {
    if (widget.phoneInitial != null) {
      numberController =
          TextEditingController(text: widget.phoneInitial?.number ?? "");
      branchLineController = TextEditingController(
        text: widget.phoneInitial?.branchLine?.toString() ?? "",
      );
      phoneTypeController = TextEditingController(
        text: widget.phoneInitial?.typeCode.toString() ?? "",
      );
    } else {
      numberController = TextEditingController();
      branchLineController = TextEditingController();
      phoneTypeController = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: textFieldFormKey,
            child: Column(
              children: [
                ParameterDropdown(
                  readOnly: widget.isEdit,
                  controller: phoneTypeController,
                  title: ModaVestLabels.phoneType,
                  parameterSearch: EnumParameters.pesTipoTelefone,
                  excludeItens: widget.phoneInitial != null
                      ? () {
                          List<String> all = widget.alredyAddedPhones
                              .map((e) => e.typeCode.toString())
                              .toList();
                          all.removeWhere((element) =>
                              element ==
                              widget.phoneInitial?.typeCode.toString());
                          return all;
                        }.call()
                      : widget.alredyAddedPhones
                          .map((e) => e.typeCode.toString())
                          .toList(),
                ),
                ModaVestTelefoneField(
                  controller: numberController,
                  title: ModaVestLabels.phone,
                ),
                ModaVestTextField(
                  controller: branchLineController,
                  title: ModaVestLabels.branchLine,
                  keyboardType: TextInputType.number,
                  maskFormatter: [
                    TextInputMask(
                      mask: ['9999'],
                    ),
                  ],
                  isRequired: false,
                ),
              ],
            ),
          ),
          ModaVestTextButton(
            title: widget.phoneInitial != null
                ? ModaVestLabels.save
                : ModaVestLabels.add,
            onPressed: () {
              if (textFieldFormKey.currentState?.validate() ?? false) {
                widget.onAdd.call(
                  LegalPersonPhone(
                    number: numberController.text,
                    branchLine: int.tryParse(branchLineController.text),
                    typeCode: int.parse(phoneTypeController.text),
                    sequence: widget.phoneInitial?.sequence ?? widget.sequence,
                  ),
                );
              }
            },
          ),
          if (widget.phoneInitial?.sequence != null)
            ModaVestTextButton(
              title: ModaVestLabels.delete,
              outlined: true,
              onPressed: () => widget.onRemove.call(
                widget.phoneInitial?.sequence ?? widget.sequence,
              ),
            ),
        ],
      ),
    );
  }
}
