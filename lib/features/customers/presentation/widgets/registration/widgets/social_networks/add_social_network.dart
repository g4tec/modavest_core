import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';
import 'package:modavest_core/widgets/parameter/parameter_dropdown.dart';

class AddSocialNetwork extends StatefulWidget {
  final EnterpriseSocialNetwork? socialNetworkInitial;
  final void Function(EnterpriseSocialNetwork) onAdd;
  final void Function(int)? onRemove;
  final int sequence;
  const AddSocialNetwork({
    super.key,
    required this.onAdd,
    required this.sequence,
    this.onRemove,
    this.socialNetworkInitial,
  });

  @override
  State<AddSocialNetwork> createState() => _AddSocialNetworkState();
}

class _AddSocialNetworkState extends State<AddSocialNetwork> {
  late TextEditingController addressController;
  late TextEditingController typeSocialNetworkController;
  final GlobalKey<FormState> textFieldFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    addressController =
        TextEditingController(text: widget.socialNetworkInitial?.address ?? "");
    typeSocialNetworkController = TextEditingController(
      text: widget.socialNetworkInitial?.typeCode?.toString() ?? "",
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
                parameterSearch: EnumParameters.pesTipoRedeSocial,
                controller: typeSocialNetworkController,
                title: ModaVestLabels.socialNetworkType,
              ),
              ModaVestTextField(
                controller: addressController,
                title: ModaVestLabels.socialAddress,
                maxLength: 45,
              ),
            ],
          ),
        ),
        ModaVestTextButton(
          title: widget.socialNetworkInitial?.sequence != null
              ? ModaVestLabels.edit
              : ModaVestLabels.add,
          onPressed: () {
            if (textFieldFormKey.currentState?.validate() ?? false) {
              widget.onAdd.call(
                EnterpriseSocialNetwork(
                  address: addressController.text,
                  sequence:
                      widget.socialNetworkInitial?.sequence ?? widget.sequence,
                  typeCode: num.tryParse(typeSocialNetworkController.text),
                  integrationId: widget.socialNetworkInitial?.integrationId,
                ),
              );
            }
          },
        ),
        if (widget.socialNetworkInitial?.sequence != null &&
            widget.onRemove != null)
          ModaVestTextButton(
            title: ModaVestLabels.delete,
            outlined: true,
            onPressed: () => widget.onRemove?.call(
              widget.socialNetworkInitial?.sequence ?? widget.sequence,
            ),
          ),
      ],
    );
  }
}
