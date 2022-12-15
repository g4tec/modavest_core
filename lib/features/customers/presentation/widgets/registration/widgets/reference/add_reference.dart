import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';
import 'package:modavest_core/widgets/fields/modavest_phone_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';

class AddReference extends StatefulWidget {
  final EnterpriseReference? referenceInitial;
  final void Function(EnterpriseReference) onAdd;
  final void Function(int)? onRemove;
  final int sequence;
  const AddReference({
    super.key,
    required this.onAdd,
    required this.sequence,
    this.onRemove,
    this.referenceInitial,
  });

  @override
  State<AddReference> createState() => _AddReferenceState();
}

class _AddReferenceState extends State<AddReference> {
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController typeController;
  late TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController =
        TextEditingController(text: widget.referenceInitial?.name ?? "");
    phoneNumberController =
        TextEditingController(text: widget.referenceInitial?.phoneNumber ?? "");
    typeController = TextEditingController(
      text: referenceTypes.containsKey(widget.referenceInitial?.typeReference)
          ? widget.referenceInitial?.typeReference
          : "",
    );
    descriptionController =
        TextEditingController(text: widget.referenceInitial?.description ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              ModaVestDropdownField(
                controller: typeController,
                title: ModaVestLabels.typeReference,
                items: referenceTypes,
                readOnly: widget.referenceInitial != null,
              ),
              ModaVestTextField(
                controller: nameController,
                title: ModaVestLabels.responsableName,
                maxLength: 45,
              ),
              ModaVestTextField(
                controller: descriptionController,
                title: ModaVestLabels.descriptionReference,
                maxLength: 20,
              ),
              ModaVestTelefoneField(
                controller: phoneNumberController,
                title: ModaVestLabels.phone,
              ),
            ],
          ),
        ),
        ModaVestTextButton(
          title: widget.referenceInitial?.sequence != null
              ? ModaVestLabels.edit
              : ModaVestLabels.add,
          onPressed: () {
            final FormState form = formKey.currentState!;
            if (form.validate()) {
              widget.onAdd.call(
                EnterpriseReference(
                  name: nameController.text,
                  sequence:
                      widget.referenceInitial?.sequence ?? widget.sequence,
                  phoneNumber: phoneNumberController.text,
                  typeReference: typeController.text,
                  description: descriptionController.text,
                ),
              );
            }
          },
        ),
        if (widget.referenceInitial?.sequence != null &&
            widget.onRemove != null)
          ModaVestTextButton(
            title: ModaVestLabels.delete,
            outlined: true,
            onPressed: () {
              final FormState form = formKey.currentState!;
              if (form.validate()) {
                widget.onRemove?.call(
                  widget.referenceInitial?.sequence ?? widget.sequence,
                );
              }
            },
          ),
      ],
    );
  }
}
