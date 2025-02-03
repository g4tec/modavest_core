import 'package:flutter/material.dart';

class ModavestTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;
  final double verticalPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final bool captalize;

  const ModavestTitle(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.center,
    this.color = const Color(0xff4e4e4e),
    this.fontSize = 16,
    this.verticalPadding = 10,
    this.mainAxisAlignment,
    this.captalize = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              captalize ? text.toUpperCase() : text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }
}
