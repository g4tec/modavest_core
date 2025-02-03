import 'package:flutter/material.dart';

class BagStepper extends StatelessWidget {
  final int curentStep;
  final Map<int, String> steps;
  final void Function({int nextStep})? onChangeStep;

  const BagStepper({
    super.key,
    required this.curentStep,
    required this.steps,
    this.onChangeStep,
  });

  List<Widget> buildSteps(BuildContext context) {
    final List<Widget> stepsWidget = [];
    steps.forEach((key, value) {
      final bool isCurrent = key == curentStep;
      stepsWidget.add(
        GestureDetector(
          onTap: () {
            onChangeStep?.call(nextStep: key);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isCurrent
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).unselectedWidgetColor.withAlpha(50),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isCurrent ? Colors.white : Colors.black,
                    fontSize: 17),
              ),
            ),
          ),
        ),
      );
    });

    return stepsWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildSteps(context),
        ),
      ),
    );
  }
}
