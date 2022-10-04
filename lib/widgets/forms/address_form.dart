import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_public_places.dart';
import 'package:modavest_core/assets/modavest_states.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/utils/format_cep.dart';
import 'package:modavest_core/utils/show_toast.dart';
import 'package:modavest_core/widgets/fields/modavest_cep_field.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';
import 'package:modavest_core/widgets/fields/modavet_text_field.dart';
import 'package:search_cep/search_cep.dart';

/// Formulário com campos padrão para endereço.
///
/// Para adicionar campos ao formulário utilize a propriedade specialistFields.
///
/// Para validar o formulário utilize a 'formKey'.
class AddressForm extends StatefulWidget {
  /// Valores de index maiores que o tamanho atual irão resultar no erro 'Invalid value: Not in inclusive range'
  /// Lista de <MapEntry<int, Widget>> onde a 'key' indica a posição do campo na formulario e o 'value' é o campo de input
  final List<MapEntry<int, Widget>> specialistFields;

  final GlobalKey<FormState> textFieldFormKey = GlobalKey<FormState>();

  final Address? initialAddress;

  /// Forneça a 'formKey' para validar o formulário

  AddressForm({
    Key? stateKey,
    this.specialistFields = const [],
    this.initialAddress,
  }) : super(key: stateKey);

  @override
  AddressFormState createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  late Field cep;

  late Field neighborhood;

  late Field publicPlace;

  late Field address;

  late Field number;

  late Field complement;

  late Field reference;

  late Field state;

  late Field city;

  void onValidateCep(ViaCepInfo? cep) {
    if (cep?.bairro != null) {
      neighborhood.controller.text = cep!.bairro!;
    }

    if (cep?.logradouro != null) {
      final List<String> listLogradouroSplit = cep!.logradouro!.split(" ");

      if (publicPlaces
          .map((key, value) => MapEntry(key, value.toLowerCase()))
          .containsValue(listLogradouroSplit[0].toLowerCase())) {
        publicPlace.controller.text = listLogradouroSplit[0];
        address.controller.text = listLogradouroSplit
            .sublist(1, listLogradouroSplit.length)
            .join(" ");
      } else {
        publicPlace.controller.text = "Outro";
        address.controller.text = cep.logradouro!;
      }
    }

    if (cep?.localidade != null) {
      city.controller.text = cep!.localidade!;
    }

    if (cep?.uf != null) {
      try {
        final MapEntry<String, String> indexState = states.entries.firstWhere(
          (MapEntry<String, String> entry) =>
              entry.value == cep?.uf?.toUpperCase(),
        );
        setState(() {
          state.controller.text = indexState.key;
        });
      } catch (e) {
        toast(ModaVestLabels.stateNotFound);
      }
    }
  }

  @override
  void initState() {
    late String stateString;
    late String publicPlaceString;
    try {
      stateString = widget.initialAddress != null
          ? states.entries
              .firstWhere(
                (element) =>
                    element.value == widget.initialAddress!.stateAbbreviation,
              )
              .key
          : "";
    } catch (e) {
      stateString = "";
    }

    try {
      publicPlaceString = widget.initialAddress != null
          ? publicPlaces.entries
              .firstWhere(
                (element) =>
                    element.value.toUpperCase() ==
                    widget.initialAddress!.publicPlace?.toUpperCase(),
              )
              .key
          : "";
    } catch (e) {
      publicPlaceString = "";
    }
    cep = Field(
      key: const Key("cep"),
      title: ModaVestLabels.requiredCep,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? formatCep(widget.initialAddress!.cep.replaceAll("-", ""))
            : null,
      ),
    );

    neighborhood = Field(
      key: const Key("neighborhood"),
      title: ModaVestLabels.district,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.neighborhood
            : null,
      ),
    );

    publicPlace = Field(
      key: const Key("publicPlace"),
      title: ModaVestLabels.placeType,
      controller: TextEditingController(
        text: publicPlaceString,
      ),
    );

    address = Field(
      key: const Key("address"),
      title: ModaVestLabels.place,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.address
            : null,
      ),
    );
    number = Field(
      key: const Key("number"),
      title: ModaVestLabels.number,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.number.toString()
            : null,
      ),
    );

    complement = Field(
      key: const Key("complement"),
      title: ModaVestLabels.complement,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.complement
            : null,
      ),
    );

    reference = Field(
      key: const Key("reference"),
      title: ModaVestLabels.reference,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.reference
            : null,
      ),
    );

    state = Field(
      key: const Key("country"),
      title: ModaVestLabels.uf,
      controller: TextEditingController(
        text: stateString,
      ),
    );

    city = Field(
      key: const Key("state"),
      title: ModaVestLabels.city,
      controller: TextEditingController(
        text: widget.initialAddress != null
            ? widget.initialAddress!.cityName
            : null,
      ),
    );
    super.initState();
  }

  List<Widget> buildChildren() {
    final List<Widget> children = [
      ModavestCepField(
        key: cep.key,
        controller: cep.controller,
        title: cep.title,
        onValidateCep: onValidateCep,
      ),
      ModaVestDropdownField(
        controller: state.controller,
        title: state.title,
        items: states,
      ),
      ModaVestTextField(
        controller: city.controller,
        title: city.title,
        maxLength: 60,
      ),
      ModaVestTextField(
        key: neighborhood.key,
        controller: neighborhood.controller,
        title: neighborhood.title,
        maxLength: 60,
      ),
      ModaVestDropdownField(
        controller: publicPlace.controller,
        title: publicPlace.title,
        items: publicPlaces,
      ),
      ModaVestTextField(
        key: address.key,
        controller: address.controller,
        title: address.title,
        maxLength: 60,
      ),
      ModaVestTextField(
        key: number.key,
        controller: number.controller,
        title: number.title,
        keyboardType: TextInputType.number,
        maskFormatter: [
          TextInputMask(
            mask: ['99999'],
          )
        ],
      ),
      ModaVestTextField(
        key: complement.key,
        controller: complement.controller,
        title: complement.title,
        maxLength: 65,
        isRequired: false,
      ),
      ModaVestTextField(
        key: reference.key,
        controller: reference.controller,
        title: reference.title,
        textInputAction: TextInputAction.done,
        maxLength: 60,
        isRequired: false,
      ),
    ];
    for (final MapEntry<int, Widget> element in widget.specialistFields) {
      try {
        children.insertAll(element.key, [element.value]);
      } catch (e) {
        rethrow;
      }
    }
    return children;
  }

  Address save() {
    return Address(
      publicPlace: publicPlaces[publicPlace.controller.text],
      number: num.parse(number.controller.text),
      complement: complement.controller.text,
      neighborhood: neighborhood.controller.text,
      cityName: city.controller.text,
      stateAbbreviation: states[state.controller.text],
      cep: cep.controller.text.replaceAll(RegExp(r'[^\w\s]+'), ''),
      reference: reference.controller.text,
      address: address.controller.text,
    );
  }

  bool validate() {
    final FormState enderecoFormState = widget.textFieldFormKey.currentState!;

    return enderecoFormState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.textFieldFormKey,
      child: Column(
        children: buildChildren(),
      ),
    );
  }
}

class Field {
  final Key key;
  final String title;
  final TextEditingController controller;
  Field({required this.key, required this.title, required this.controller});
}
