import 'package:flutter/material.dart';
import 'package:modavest_core/utils/validator/default_validator.dart';

import 'package:modavest_core/features/bag/presentation/widgets/questionWidget/question_widget.dart';

class LongAnswer extends QuestionWidget {
  final String? initialValue;
  const LongAnswer({
    super.key,
    required this.initialValue,
    required void Function(dynamic) super.onChange,
    required super.isRequired,
  });

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
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "Digite sua resposta",
          hintStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.grey[700]),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
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
