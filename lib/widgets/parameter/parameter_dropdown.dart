import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/parameter_type.dart';
import 'package:modavest_core/widgets/fields/modavest_dropdown_field.dart';

class ParameterDropdown extends StatefulWidget {
  final EnumParameters parameterSearch;
  final TextEditingController controller;
  final String title;
  final List<String>? excludeItens;
  final bool readOnly;
  const ParameterDropdown({
    super.key,
    required this.parameterSearch,
    required this.controller,
    required this.title,
    this.excludeItens,
    this.readOnly = false,
  });

  @override
  State<ParameterDropdown> createState() => _ParameterDropdownState();
}

class _ParameterDropdownState extends State<ParameterDropdown> {
  late Map<String?, String> items;

  @override
  void initState() {
    items = {};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = {
      for (final ParameterType v in widget.parameterSearch.value.items)
        v.variant: v.value
    };
    if (widget.excludeItens != null) {
      items.removeWhere(
        (key, value) => widget.excludeItens?.contains(key) ?? false,
      );
    }
    if (widget.controller.text.isNotEmpty) {
      if (!items.containsKey(widget.controller.text)) {
        items.putIfAbsent(
          widget.controller.text,
          () => "Tipo ${widget.controller.text} (não reconhecido)",
        );
      }
    }

    return ModaVestDropdownField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      title: widget.title,
      items: items,
    );
  }
}
