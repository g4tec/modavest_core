import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_gender.dart';
import 'package:modavest_core/assets/modavest_marital_status.dart';
import 'package:modavest_core/data/models/individuals/individuals_model.dart';
import 'package:modavest_core/domain/models/individual.dart';
import 'package:modavest_core/widgets/fields/modavest_cnpj_field.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';

/// Formulário com campos padrão para perfil.
///
/// Para adicionar campos ao formulário utilize a propriedade specialistFields.
///
/// Para validar o formulário utilize a 'formKey'.
class IndividualForm extends StatefulWidget {
  /// Valores de index maiores que o tamanho atual irão resultar no erro 'Invalid value: Not in inclusive range'
  /// Lista de <MapEntry<int, Field>> onde a 'key' indica a posição do campo na formulario e o 'value' é o campo de input
  final List<MapEntry<int, Field>> specialistFields;

  /// Forneça a 'formKey' para validar o formulário
  final GlobalKey formKey;
  final Individual? initialIndividual;
  final String? initialCpf;
  final String? initialName;

  const IndividualForm({
    required this.formKey,
    this.specialistFields = const [],
    this.initialCpf,
    this.initialIndividual,
    this.initialName,
  }) : super(key: formKey);

  @override
  IndividualFormState createState() => IndividualFormState();
}

class IndividualFormState extends State<IndividualForm> {
  late Field cpf;
  late Field name;
  late Field gender;
  late Field birthDate;
  late Field maritalStatus;
  late Field nationality;
  late Field occupation;
  late Field income;
  bool isentable = false;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    cpf = Field(
      key: const Key("cpf"),
      title: ModaVestLabels.cpf,
      controller: TextEditingController(
        text: widget.initialIndividual?.cpf ?? (widget.initialCpf ?? ""),
      ),
    );

    name = Field(
      key: const Key("name"),
      title: ModaVestLabels.fullName,
      controller: TextEditingController(
        text: widget.initialIndividual?.name ?? "",
      ),
    );

    gender = Field(
      key: const Key("gender"),
      title: ModaVestLabels.gender,
      controller: TextEditingController(
        text: widget.initialIndividual?.gender ?? "",
      ),
    );

    birthDate = Field(
      key: const Key("birthDate"),
      title: ModaVestLabels.birthDate,
      controller: TextEditingController(
        text: widget.initialIndividual?.birthDate ?? "",
      ),
    );

    maritalStatus = Field(
      key: const Key("maritalStatus"),
      title: ModaVestLabels.maritalStatus,
      controller: TextEditingController(
        text: widget.initialIndividual?.maritalStatus ?? "",
      ),
    );
    nationality = Field(
      key: const Key("nationality"),
      title: ModaVestLabels.nationality,
      controller: TextEditingController(
        text: widget.initialIndividual?.nationality ?? "",
      ),
    );
    occupation = Field(
      key: const Key("occupation"),
      title: ModaVestLabels.occupation,
      controller: TextEditingController(
        text: widget.initialIndividual?.occupation ?? "",
      ),
    );

    income = Field(
      key: const Key("income"),
      title: ModaVestLabels.income,
      controller: TextEditingController(
        text: widget.initialIndividual?.monthlyIncome.toString() ?? "",
      ),
    );
    super.initState();
  }

  Individual getValues() {
    return IndividualModel(
      cpf: cpf.controller!.text.replaceAll(RegExp(r'[^\w\s]+'), ''),
      name: name.controller!.text,
      gender: gender.controller!.text,
      birthDate: birthDate.controller!.text,
      maritalStatus: maritalStatus.controller!.text,
      nationality: nationality.controller!.text,
      occupation: occupation.controller!.text,
      monthlyIncome: num.tryParse(income.controller!.text) ?? 0,
      insertDate: DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal()),
      addresses: [],
      emails: [],
      phones: [],
      references: [],
    );
  }

  List<Widget> buildChildren() {
    final List<Widget> children = [
      ModaVestCNPJField(
        key: cpf.key,
        controller: cpf.controller!,
        label: ModaVestLabels.cpf,
        readOnly: true,
        maskFormatterCnpjCpf: TextInputMask(
          mask: ['999.999.999-99'],
        ),
      ),
      ModaVestTextField(
        key: name.key,
        controller: name.controller!,
        title: name.title!,
        maxLength: 60,
      ),
      ModaVestDropdownField(
        key: gender.key,
        controller: gender.controller!,
        items: modavestGender,
        title: gender.title!,
        isRequired: !isentable,
        readOnly: isentable,
      ),
      ModaVestTextField(
        key: birthDate.key,
        controller: birthDate.controller!,
        title: birthDate.title!,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        maxLength: 60,
        isRequired: false,
        maskFormatter: [
          TextInputMask(
            mask: ['99/99/9999'],
          )
        ],
      ),
      ModaVestDropdownField(
        key: maritalStatus.key,
        controller: maritalStatus.controller!,
        items: modavestMaritalStatus,
        title: maritalStatus.title!,
        isRequired: !isentable,
        readOnly: isentable,
      ),
      ModaVestTextField(
        key: nationality.key,
        controller: nationality.controller!,
        title: nationality.title!,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        maxLength: 60,
        isRequired: false,
      ),
      ModaVestTextField(
        key: occupation.key,
        controller: occupation.controller!,
        title: occupation.title!,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        maxLength: 60,
        isRequired: false,
      ),
      ModaVestTextField(
        key: income.key,
        controller: income.controller!,
        title: income.title!,
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
