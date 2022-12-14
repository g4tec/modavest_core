import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavest_email_field.dart';
import 'package:modavest_core/widgets/fields/modavest_phone_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';
import 'package:modavest_core/widgets/parameter/parameter_dropdown.dart';

class AddContact extends StatefulWidget {
  final LegalPersonContact? contactInitial;
  final void Function(LegalPersonContact) onAdd;
  final void Function(int)? onRemove;
  final int sequence;
  const AddContact({
    super.key,
    required this.onAdd,
    required this.sequence,
    this.onRemove,
    this.contactInitial,
  });

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController cellNumberController;
  late TextEditingController emailController;
  late TextEditingController typeContactController;
  final GlobalKey<FormState> textFieldFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController =
        TextEditingController(text: widget.contactInitial?.name ?? "");
    phoneNumberController =
        TextEditingController(text: widget.contactInitial?.phoneNumber ?? "");
    cellNumberController =
        TextEditingController(text: widget.contactInitial?.cellNumber ?? "");
    emailController =
        TextEditingController(text: widget.contactInitial?.email ?? "");
    typeContactController = TextEditingController(
      text: widget.contactInitial?.typeCode?.toString() ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Form(
          key: textFieldFormKey,
          child: Column(
            children: [
              ParameterDropdown(
                parameterSearch: EnumParameters.pesTipoContato,
                controller: typeContactController,
                title: ModaVestLabels.contactType,
              ),
              ModaVestTextField(
                controller: nameController,
                title: ModaVestLabels.name,
                maxLength: 45,
              ),
              ModaVestTelefoneField(
                controller: phoneNumberController,
                title: ModaVestLabels.phone,
                isRequired: false,
              ),
              ModaVestTelefoneField(
                controller: cellNumberController,
                title: ModaVestLabels.cellPhone,
                isRequired: false,
              ),
              ModavestEmailField(
                controller: emailController,
                title: ModaVestLabels.mail,
                maxLength: 45,
                isRequired: false,
              ),
            ],
          ),
        ),
        ModaVestTextButton(
          title: widget.contactInitial?.sequence != null
              ? ModaVestLabels.edit
              : ModaVestLabels.add,
          onPressed: () {
            if (textFieldFormKey.currentState?.validate() ?? false) {
              widget.onAdd.call(
                LegalPersonContact(
                  name: nameController.text,
                  sequence: widget.contactInitial?.sequence ?? widget.sequence,
                  phoneNumber: phoneNumberController.text,
                  cellNumber: cellNumberController.text,
                  email: emailController.text,
                  typeCode: num.tryParse(typeContactController.text),
                  legalPersonCode: widget.contactInitial?.legalPersonCode,
                  integrationId: widget.contactInitial?.integrationId,
                ),
              );
            }
          },
        ),
        if (widget.contactInitial?.sequence != null && widget.onRemove != null)
          ModaVestTextButton(
            title: ModaVestLabels.delete,
            outlined: true,
            onPressed: () => widget.onRemove?.call(
              widget.contactInitial?.sequence ?? widget.sequence,
            ),
          ),
      ],
    );
  }
}
