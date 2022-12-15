import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/fields/modavest_email_field.dart';
import 'package:modavest_core/widgets/parameter/parameter_dropdown.dart';

class CustomerAddMainEmailRegistrationPage extends StatefulWidget {
  final void Function(LegalPersonEmail) onAdd;
  final LegalPersonEmail? emailInitial;
  final void Function(num) onRemove;
  final num sequence;
  final List<LegalPersonEmail> alredyAddedEmails;
  final bool isEdit;
  const CustomerAddMainEmailRegistrationPage({
    super.key,
    required this.onAdd,
    required this.emailInitial,
    required this.onRemove,
    required this.sequence,
    this.alredyAddedEmails = const [],
    this.isEdit = false,
  });

  @override
  CustomerAddMainEmailRegistrationPageState createState() =>
      CustomerAddMainEmailRegistrationPageState();
}

class CustomerAddMainEmailRegistrationPageState
    extends State<CustomerAddMainEmailRegistrationPage> {
  final GlobalKey<FormState> textFieldFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController typeEmailController = TextEditingController();

  @override
  void initState() {
    if (widget.emailInitial != null) {
      emailController =
          TextEditingController(text: widget.emailInitial?.email ?? "");

      typeEmailController = TextEditingController(
        text: widget.emailInitial?.typeCode.toString() ?? "",
      );
    } else {
      emailController = TextEditingController();
      typeEmailController = TextEditingController();
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
                  parameterSearch: EnumParameters.pesTipoEmail,
                  controller: typeEmailController,
                  title: ModaVestLabels.emailTypes,
                  excludeItens: widget.emailInitial != null
                      ? () {
                          final List<String> all = widget.alredyAddedEmails
                              .map((e) => e.typeCode.toString())
                              .toList();
                          all.removeWhere((element) =>
                              element ==
                              widget.emailInitial?.typeCode.toString());
                          return all;
                        }.call()
                      : widget.alredyAddedEmails
                          .map((e) => e.typeCode.toString())
                          .toList(),
                ),
                ModavestEmailField(
                  controller: emailController,
                  title: ModaVestLabels.requiredAcessEmail,
                  maxLength: 60,
                ),
              ],
            ),
          ),
          ModaVestTextButton(
            title: widget.emailInitial != null
                ? ModaVestLabels.save
                : ModaVestLabels.add,
            onPressed: () {
              if (textFieldFormKey.currentState?.validate() ?? false) {
                widget.onAdd.call(
                  LegalPersonEmail(
                    email: emailController.text,
                    typeCode: int.parse(typeEmailController.text),
                    sequence: widget.emailInitial?.sequence ?? widget.sequence,
                  ),
                );
              }
            },
          ),
          if (widget.emailInitial?.sequence != null)
            ModaVestTextButton(
              title: ModaVestLabels.delete,
              outlined: true,
              onPressed: () => widget.onRemove.call(
                widget.emailInitial?.sequence ?? widget.sequence,
              ),
            ),
        ],
      ),
    );
  }
}
