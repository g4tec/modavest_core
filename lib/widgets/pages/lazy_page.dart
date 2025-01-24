import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_images.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';

class LazyPage extends StatefulWidget {
  final Function? onNext;
  final String? title;
  final String? subTitle;
  final bool showAppBar;

  const LazyPage({
    super.key,
    this.title,
    this.onNext,
    this.subTitle,
    this.showAppBar = false,
  });

  @override
  LazyPageState createState() => LazyPageState();
}

class LazyPageState extends State<LazyPage> {
  @override
  Widget build(BuildContext context) {
    return LazyPageWidget(widget: widget, state: this);
  }
}

class LazyPageWidget extends StatelessWidget {
  const LazyPageWidget({
    super.key,
    required this.widget,
    required this.state,
  });

  final LazyPage widget;
  final LazyPageState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  40,
                  MediaQuery.of(context).size.height * 0.1,
                  40,
                  20,
                ),
                child: Image.asset(
                  ModaVestImages.horizontalLogo,
                ),
              ),
              Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    const SizedBox(),
                  if (widget.subTitle != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.subTitle!,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    const SizedBox(),
                  ModaVestTextButton(
                    title: ModaVestLabels.continueLabel,
                    onPressed: widget.onNext,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
