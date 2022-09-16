import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/composition.dart';

class CompositionProduct extends StatelessWidget {
  final List<Composition> compositions;
  const CompositionProduct({Key? key, required this.compositions})
      : super(key: key);

  String formatComposition() {
    String formatedComposition = "";
    for (var i = 0; i < compositions.length; i++) {
      String buffer = formatedComposition;
      buffer += "${compositions[i].material} ${compositions[i].percentage}%";
      if (i < compositions.length - 1) {
        buffer += ", ";
      }
      formatedComposition = buffer;
    }

    return formatedComposition;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline5,
        children: <TextSpan>[
          TextSpan(
            text: "${ModaVestLabels.composition}: ",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(text: formatComposition()),
        ],
      ),
    );
  }
}
