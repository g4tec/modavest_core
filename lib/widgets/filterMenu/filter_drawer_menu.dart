import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class FilterDrawerMenu extends StatelessWidget {
  final Map<String, String> options;
  final void Function(List<String>?)? onChange;
  final List<String>? values;
  final List<Widget>? children;
  final String? title;
  final String? subTitle;
  final void Function()? onFilter;
  final void Function()? onClear;
  final bool showOptionsOnBottom;

  const FilterDrawerMenu({
    super.key,
    required this.options,
    this.onChange,
    required this.values,
    this.children,
    this.title,
    this.subTitle,
    this.onFilter,
    this.onClear,
    this.showOptionsOnBottom = false,
  });

  List<FormBuilderFieldOption<String>> _buildChildren(
    BuildContext context,
  ) {
    final List<FormBuilderFieldOption<String>> optionsWidget = [];

    for (final MapEntry<String, String> option in options.entries) {
      optionsWidget.add(
        FormBuilderFieldOption<String>(
          value: option.key,
          child: Text(
            option.value,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      );
    }

    return optionsWidget;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? childOptions;

    if (options.isNotEmpty) {
      childOptions = [
        if (subTitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ModavestTitle(
              subTitle!,
              captalize: false,
              color: Colors.white,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
        Material(
          color: const Color(0xff434343),
          child: FormBuilderCheckboxGroup<String>(
            name: "choices",
            orientation: OptionsOrientation.vertical,
            options: _buildChildren(context),
            initialValue: values,
            hoverColor: Colors.red,
            onChanged: onChange,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
      ];
    }

    return Container(
      color: Colors.transparent,
      height: 100,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 50,
        left: MediaQuery.of(context).size.width * 0.2,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height - 60,
        color: const Color(0xff434343),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: ModavestTitle(
                          title ?? ModaVestLabels.filter,
                          captalize: false,
                          color: Colors.white,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (childOptions != null && !showOptionsOnBottom)
                            ...childOptions,
                          if (children != null) ...children!,
                          if (childOptions != null && showOptionsOnBottom)
                            ...childOptions,
                          if (onFilter != null)
                            const SizedBox(
                              height: 75,
                            ),
                          if (onClear != null)
                            const SizedBox(
                              height: 75,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Material(
                color: const Color(0xff434343),
                child: Column(
                  children: [
                    if (onFilter != null)
                      ModaVestTextButton(
                        title: ModaVestLabels.filter.toUpperCase(),
                        onPressed: () {
                          Navigator.pop(context);
                          onFilter?.call();
                        },
                      ),
                    if (onClear != null)
                      ModaVestTextButton(
                        title: ModaVestLabels.clear.toUpperCase(),
                        outlined: true,
                        color: Colors.white,
                        onPressed: () {
                          onClear?.call();
                        },
                      ),
                    if (onClear != null)
                      const SizedBox(
                        height: 20,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
