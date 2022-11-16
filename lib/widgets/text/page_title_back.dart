import 'package:flutter/material.dart';

import 'package:modavest_core/widgets/text/modavest_title.dart';

class TitlePageBack extends StatelessWidget {
  final String title;
  final void Function()? onPop;
  final Color color;
  final Widget? leading;
  final double fontSize;
  final double verticalPadding;
  const TitlePageBack({
    Key? key,
    required this.title,
    this.onPop,
    this.color = const Color(0xff4e4e4e),
    this.leading,
    this.fontSize = 16,
    this.verticalPadding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          shape: const CircleBorder(),
          color: Theme.of(context).canvasColor,
          child: IconButton(
            color: Theme.of(context).canvasColor,
            icon: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            onPressed: onPop,
          ),
        ),
        Flexible(
          child: ModavestTitle(
            title,
            verticalPadding: verticalPadding,
            color: color,
            fontSize: fontSize,
          ),
        ),
        leading ??
            Material(
              shape: const CircleBorder(),
              color: Colors.transparent,
              child: IconButton(
                color: Colors.transparent,
                icon: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.transparent,
                  ),
                ),
                onPressed: onPop,
              ),
            ),
      ],
    );
  }
}
