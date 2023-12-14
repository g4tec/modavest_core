import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/utils/format_money.dart';

class ModavestMoneyBoldText extends StatelessWidget {
  final double originalValue;
  final double? discountValue;
  final double fontSize;
  final Color color;

  const ModavestMoneyBoldText({
    Key? key,
    required this.originalValue,
    this.discountValue,
    this.fontSize = 24,
    this.color = Colors.green,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return discountValue == null || (discountValue! - originalValue).abs() < 1
        ? AutoSizeText(
            toCurrency(originalValue),
            minFontSize: 1,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: color, fontSize: fontSize),
            textAlign: TextAlign.end,
          )
        : Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "${toCurrency(originalValue)}\t\t",
                  style: discountValue != null && discountValue != originalValue
                      ? const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )
                      : Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: color, fontSize: fontSize),
                ),
                if (discountValue != null && discountValue != originalValue)
                  TextSpan(
                    text: toCurrency(
                      num.tryParse(
                            '$discountValue',
                          )?.toDouble() ??
                          0,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: color, fontSize: fontSize),
                  ),
              ],
            ),
          );
  }
}
