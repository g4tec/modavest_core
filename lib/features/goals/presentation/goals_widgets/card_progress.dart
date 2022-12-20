import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressCard extends StatelessWidget {
  final num value;
  const ProgressCard({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      maximum: 1,
      interval: 0.25,
      tickPosition: LinearElementPosition.outside,
      labelPosition: LinearLabelPosition.outside,
      numberFormat: intl.NumberFormat.percentPattern(),
      barPointers: [
        LinearBarPointer(
          color: const Color(0xFF89DC74),
          value: value.toDouble(),
        ),
        LinearBarPointer(
          color: const Color(0xFF7474DC),
          value: value > 0.75 ? 0.75 : value.toDouble(),
        ),
        LinearBarPointer(
          color: const Color(0xFF74ccdc),
          value: value > 0.5 ? 0.5 : value.toDouble(),
        ),
        LinearBarPointer(
          color: const Color(0xFFFFEB3B),
          value: value > 0.25 ? 0.25 : value.toDouble(),
        ),
      ],
    );
  }
}
