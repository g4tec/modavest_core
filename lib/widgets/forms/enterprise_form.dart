import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_states.dart';
import 'package:modavest_core/data/models/legal_person/legal_person_model.dart';
import 'package:modavest_core/domain/models/legal_person.dart';
import 'package:modavest_core/widgets/fields/modavest_cnpj_field.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';

/// Formulário com campos padrão para perfil.
///
/// Para adicionar campos ao formulário utilize a propriedade specialistFields.
///
/// Para validar o formulário utilize a 'formKey'.
class EnterpriseForm extends StatefulWidget {
  /// Valores de index maiores que o tamanho atual irão resultar no erro 'Invalid value: Not in inclusive range'
  /// Lista de <MapEntry<int, Field>> onde a 'key' indica a posição do campo na formulario e o 'value' é o campo de input
  final List<MapEntry<int, Field>> specialistFields;

  /// Forneça a 'formKey' para validar o formulário
  final GlobalKey formKey;
  final LegalPerson? initialLegalPerson;
  final String? initialCnpj;
  final String? initialName;

  const EnterpriseForm({
    required this.formKey,
    this.specialistFields = const [],
    this.initialCnpj,
    this.initialLegalPerson,
    this.initialName,
  }) : super(key: formKey);

  @override
  EnterpriseFormState createState() => EnterpriseFormState();
}

class EnterpriseFormState extends State<EnterpriseForm> {
  late Field cnpj;
  late Field fantasyName;
  late Field socialReason;
  late Field numberStateRegistration;
  late Field ufStateRegistration;
  late Field homePage;
  late Field cpfCnpjMainRelated;
  bool isentable = false;
  bool isRelated = false;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    cnpj = Field(
      key: const Key("cnpj"),
      title: ModaVestLabels.cnpj,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.cnpj ?? (widget.initialCnpj ?? ""),
      ),
    );

    fantasyName = Field(
      key: const Key("fantasyName"),
      title: ModaVestLabels.fantasyName,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.fantasyName ?? "",
      ),
    );

    socialReason = Field(
      key: const Key("socialReason"),
      title: ModaVestLabels.socialReason,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.name ?? (widget.initialName ?? ""),
      ),
    );

    numberStateRegistration = Field(
      key: const Key("numberStateRegistration"),
      title: ModaVestLabels.numberStateRegistration,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.numberStateRegistration ?? "",
      ),
    );

    ufStateRegistration = Field(
      key: const Key("ufStateRegistration"),
      title: ModaVestLabels.ufStateRegistration,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.uf ?? "",
      ),
    );

    homePage = Field(
      key: const Key("homePage"),
      title: ModaVestLabels.homePage,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.homePage ?? "",
      ),
    );

    cpfCnpjMainRelated = Field(
      key: const Key("cpfCnpjMainRelated"),
      title: ModaVestLabels.cpfCnpjMainRelated,
      controller: TextEditingController(
        text: widget.initialLegalPerson?.cpfCnpjMainRelated ?? "",
      ),
    );

    isRelated = widget.initialLegalPerson?.cpfCnpjMainRelated != null;

    if ((widget.initialLegalPerson?.numberStateRegistration ?? "") ==
        "ISENTO") {
      isentable = true;
    }
    super.initState();
  }

  LegalPerson getValues() {
    return LegalPersonModel(
      cnpj: cnpj.controller!.text.replaceAll(RegExp(r'[^\w\s]+'), ''),
      fantasyName: fantasyName.controller!.text,
      name: socialReason.controller!.text,
      numberStateRegistration: isentable
          ? "ISENTO"
          : numberStateRegistration.controller!.text
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
      uf: isentable ? null : states[ufStateRegistration.controller!.text],
      homePage: homePage.controller!.text,
      cpfCnpjMainRelated: cpfCnpjMainRelated.controller!.text,
      insertDate: DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal()),
      addresses: [],
      emails: [],
      phones: [],
      contacts: [],
      references: [],
      socialNetworks: [],
    );
  }

  List<Widget> buildChildren() {
    final List<Widget> children = [
      ModaVestCNPJField(
        key: cnpj.key,
        controller: cnpj.controller!,
        label: ModaVestLabels.cnpj,
        cnpjOnly: true,
        readOnly: true,
        maskFormatterCnpjCpf: TextInputMask(
          mask: ['99.999.999/9999-99'],
        ),
      ),
      ModaVestTextField(
        key: fantasyName.key,
        controller: fantasyName.controller!,
        title: fantasyName.title!,
        maxLength: 60,
      ),
      ModaVestTextField(
        key: socialReason.key,
        controller: socialReason.controller!,
        title: socialReason.title!,
        maxLength: 60,
      ),
      CheckboxListTile(
        key: const Key("isRelated"),
        value: isRelated,
        onChanged: (value) {
          setState(() {
            isRelated = value ?? false;
          });
        },
        title: Text(
          ModaVestLabels.isRelated,
          style: Theme.of(context).textTheme.headline5,
        ),
        contentPadding: EdgeInsets.zero,
        activeColor: Theme.of(context).primaryColor,
      ),
      if (isRelated)
        ModaVestCNPJField(
          key: cpfCnpjMainRelated.key,
          controller: cpfCnpjMainRelated.controller!,
          label: cpfCnpjMainRelated.title!,
        ),
      CheckboxListTile(
        key: const Key("isentable"),
        value: isentable,
        onChanged: (value) {
          setState(() {
            isentable = value ?? false;
          });
        },
        title: Text(
          ModaVestLabels.isentable,
          style: Theme.of(context).textTheme.headline5,
        ),
        contentPadding: EdgeInsets.zero,
        activeColor: Theme.of(context).primaryColor,
      ),
      ModaVestTextField(
        key: numberStateRegistration.key,
        controller: numberStateRegistration.controller!,
        title: numberStateRegistration.title!,
        keyboardType: TextInputType.number,
        readOnly: isentable,
        isRequired: !isentable,
        maxLength: 18,
      ),
      ModaVestDropdownField(
        key: ufStateRegistration.key,
        controller: ufStateRegistration.controller!,
        items: states,
        title: ufStateRegistration.title!,
        isRequired: !isentable,
        readOnly: isentable,
      ),
      ModaVestTextField(
        key: homePage.key,
        controller: homePage.controller!,
        title: homePage.title!,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        maxLength: 60,
        isRequired: false,
      ),
    ];
    for (final MapEntry<int, Field> element in widget.specialistFields) {
      try {
        children.insertAll(element.key, [element.value.widget!]);
      } catch (e) {
        rethrow;
      }
    }
    return children;
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: buildChildren(),
      ),
    );
  }
}

class Field {
  final Key key;
  final String? title;
  final TextEditingController? controller;
  late Widget? widget;
  Field({
    required this.key,
    this.title,
    this.controller,
    this.widget,
  });
}
