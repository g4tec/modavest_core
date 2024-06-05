import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modavest_core/data/models/options/options_model.dart';
import 'package:modavest_core/domain/models/options.dart';
import 'package:modavest_core/features/bag/presentation/widgets/questionWidget/question_widget.dart';

class MultipleChoice extends QuestionWidget {
  final List<Options> options;
  final dynamic initialValue;
  final InputDecoration? decoration;
  final bool whiteBg;
  const MultipleChoice(
      {super.key,
      required this.options,
      required this.initialValue,
      required void Function(dynamic) super.onChange,
      required super.isRequired,
      this.whiteBg = false,
      this.decoration});

  @override
  MultipleChoiceState createState() => MultipleChoiceState();
}

class MultipleChoiceState extends State<MultipleChoice> {
  List<FormBuilderFieldOption<Options>> _buildChildren() {
    final List<FormBuilderFieldOption<Options>> optionsWidget = [];

    for (final Options option in widget.options) {
      optionsWidget.add(
        FormBuilderFieldOption<Options>(
          value: option,
          child: Text(
            option.option,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                color: widget.whiteBg ? Colors.white : null,
                fontWeight: FontWeight.w800),
          ),
        ),
      );
    }

    return optionsWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        toggleableActiveColor: MaterialStateColor.resolveWith(
          (states) {
            return const Color(0xff4d0c70);
          },
        ),
        canvasColor: MaterialStateColor.resolveWith(
          (states) {
            return const Color(0xff4d0c70);
          },
        ),
        unselectedWidgetColor: MaterialStateColor.resolveWith(
          (states) {
            return widget.whiteBg ? Colors.white : Color(0xff4d0c70);
          },
        ),
        backgroundColor: Colors.white,
        checkboxTheme: CheckboxThemeData(
          overlayColor: MaterialStateColor.resolveWith(
            (states) {
              return widget.whiteBg ? Colors.white : Color(0xff4d0c70);
            },
          ),
        ),
      ),
      child: FormBuilderCheckboxGroup<Options>(
        name: "choices",
        options: _buildChildren(),
        initialValue: widget.initialValue is Iterable<OptionsModel>
            ? (widget.initialValue as Iterable<OptionsModel>).toList()
            : (widget.initialValue as List<Options>?)
                ?.map((e) => OptionsModel.entity(e))
                .toList(),
        onChanged: widget.onChange,
        decoration: widget.decoration ??
            const InputDecoration(
              border: InputBorder.none,
            ),
        validator: widget.isRequired
            ? (value) {
                return value != null && value.isNotEmpty
                    ? null
                    : "Responda essa questão";
              }
            : null,
      ),
    );
  }
}
