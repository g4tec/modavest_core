import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/options.dart';
import 'package:modavest_core/features/bag/presentation/widgets/questionWidget/question_widget.dart';

class Choice extends QuestionWidget {
  final List<Options> options;
  final dynamic initialValue;
  const Choice({
    super.key,
    required this.options,
    required this.initialValue,
    required void Function(dynamic) super.onChange,
    required super.isRequired,
  });

  @override
  ChoiceState createState() => ChoiceState();
}

class ChoiceState extends State<Choice> {
  List<DropdownMenuItem<Options>> _buildItems() {
    final List<DropdownMenuItem<Options>> optionsWidget = [];

    for (final Options option in widget.options) {
      optionsWidget.add(
        DropdownMenuItem<Options>(
          value: option,
          child: Text(
            option.option,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      );
    }
    return optionsWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<Options>(
        value: widget.initialValue as Options?,
        style: Theme.of(context).textTheme.headline5,
        onChanged: widget.onChange,
        items: _buildItems(),
        isExpanded: true,
        validator: widget.isRequired
            ? (value) {
                return value != null ? null : "Responda essa questão";
              }
            : null,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: Theme.of(context).textTheme.headline5,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
