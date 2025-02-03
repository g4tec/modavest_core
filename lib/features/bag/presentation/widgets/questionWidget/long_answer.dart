import 'package:flutter/material.dart';
import 'package:modavest_core/features/bag/presentation/widgets/questionWidget/question_widget.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

class LongAnswer extends QuestionWidget {
  final String? initialValue;
  final String? label;
  final InputDecoration? decoration;
  const LongAnswer(
      {super.key,
      required this.initialValue,
      required void Function(dynamic) super.onChange,
      required super.isRequired,
      this.label,
      this.decoration});

  @override
  LongAnswerState createState() => LongAnswerState();
}

class LongAnswerState extends State<LongAnswer> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        onEditingComplete: () {
          widget.onChange.call(controller.text);
        },
        onChanged: (value) {
          widget.onChange
              .call(controller.text.isNotEmpty ? controller.text : null);
        },
        maxLines: null,
        minLines: 6,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        validator: (String? value) => widget.isRequired
            ? defaultValidate.call(value, widget.isRequired)
            : null,
        decoration: widget.decoration ??
            InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Digite sua resposta",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey[700]),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
      ),
    );
  }
}
