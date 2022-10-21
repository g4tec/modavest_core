import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/features/products/presentation/blocs/discount_bloc/discount_presentation_bloc.dart';
import 'package:modavest_core/utils/format_money.dart';

class ModavestProductDiscountPrice extends StatelessWidget {
  final ProductPrice? price;
  final double spacing;
  final DiscountPresentationBloc bloc;

  const ModavestProductDiscountPrice({
    super.key,
    required this.price,
    required this.spacing,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, DiscountPresentationState state) {
        if (state is DiscountPrice &&
            state.productPriceDiscountPrice.containsKey(price) &&
            state.productPriceDiscountPrice[price] != null &&
            state.productPriceDiscountPrice[price] != price?.originalPrice) {
          return Column(
            children: [
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "${toCurrency((price?.originalPrice ?? 0).toDouble())}\n",
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: toCurrency(
                        num.tryParse(
                              '${state.productPriceDiscountPrice[price]}',
                            )?.toDouble() ??
                            0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Text(
          toCurrency(
            (price?.originalPrice ?? 0).toDouble(),
          ),
        );
      },
    );
  }
}
