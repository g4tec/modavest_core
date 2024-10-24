import 'parameter_simple.dart';

class ParameterItem {
  final num? parameterId;
  final num? integrationId;
  final String? variant;
  final String? value;
  final Parameter? parameter;

  ParameterItem({
    this.parameterId,
    this.integrationId,
    required this.variant,
    required this.value,
    this.parameter,
  }) : super();
}
