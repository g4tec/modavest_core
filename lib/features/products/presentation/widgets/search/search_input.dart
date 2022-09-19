import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';

class SearchInput extends StatefulWidget {
  /// função para interceptar o submit do campo
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? title;
  final String? initialValue;
  final TextEditingController? controller;

  const SearchInput({
    Key? key,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.search,
    this.keyboardType = TextInputType.text,
    this.onSubmit,
    this.onChange,
    this.title,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  late TextEditingController controller;
  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.controller?.text = widget.initialValue!;
    }
    controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline5,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        controller: controller,
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          suffixIcon: Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                widget.onSubmit?.call(controller.text);
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              splashRadius: 24,
            ),
          ),
          labelText: widget.title ?? ModaVestLabels.whatDoYouNeed,
          labelStyle: Theme.of(context).textTheme.headline5,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
