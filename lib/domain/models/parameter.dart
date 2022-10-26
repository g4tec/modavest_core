import 'package:modavest_core/domain/models/parameter_type.dart';

class Parameter {
  final int parameterId;
  final String? code;
  final String? description;
  final String? utility;
  final String? functionality;
  final String? variant;
  final String? value;
  final bool? parameterIsActive;
  final bool? hasVariant;
  final DateTime? parameterCreatedAt;
  List<ParameterType> items;

  Parameter({
    required this.parameterId,
    this.code,
    this.description,
    this.utility,
    this.functionality,
    this.variant,
    this.value,
    this.parameterIsActive,
    this.hasVariant,
    this.parameterCreatedAt,
    required this.items,
  });
}
