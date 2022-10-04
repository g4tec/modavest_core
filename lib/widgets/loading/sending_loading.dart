import 'package:flutter/material.dart';

class SendingLoading extends StatelessWidget {
  final String title;
  final bool blackForegraund;
  const SendingLoading({
    Key? key,
    required this.title,
    this.blackForegraund = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: blackForegraund ? Colors.white : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: blackForegraund ? Colors.white : null),
            ),
          ),
        ],
      ),
    );
  }
}
