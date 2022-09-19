import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingProduct extends StatelessWidget {
  final double ratting;
  final int? totalRatting;
  const RatingProduct({
    Key? key,
    required this.ratting,
    this.totalRatting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (totalRatting != null)
          Row(
            children: [
              Text(totalRatting.toString()),
              const Icon(
                Icons.person,
                size: 16,
              )
            ],
          )
        else
          const SizedBox(),
        RatingBarIndicator(
          rating: ratting,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 20.0,
        ),
      ],
    );
  }
}
