import 'package:flutter/material.dart';

abstract class QuestionWidget extends StatefulWidget {
  final dynamic Function(dynamic) onChange;
  final bool isRequired;

  const QuestionWidget({super.key, required this.onChange, this.isRequired = false});

  @override
  State createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
