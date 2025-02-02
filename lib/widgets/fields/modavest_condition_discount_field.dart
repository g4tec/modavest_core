import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_money.dart';
import 'package:modavest_core/utils/get_payment_condition_discounts.dart';

class ModavestConditionDiscountPrice extends StatelessWidget {
  final SalesOrder order;
  final PaymentConditions condition;

  const ModavestConditionDiscountPrice({
    super.key,
    required this.order,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPaymentConditionDiscount(
        order,
        condition.averagePeriod?.variationPercentage ??
            condition.variationPercentage ??
            0,
      ),
      builder: (BuildContext context, AsyncSnapshot<double?> snapshot) {
        final String label =
            (snapshot.data ?? 0) > 0 ? "Acrécimo de " : "Desconto de";
        return Column(
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${condition.name}\n",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  if ((condition.averagePeriod?.variationPercentage ??
                          condition.variationPercentage) !=
                      null)
                    TextSpan(
                      text:
                          "$label \n${toCurrency(snapshot.data?.abs() ?? 0)} (${(condition.averagePeriod?.variationPercentage ?? condition.variationPercentage)}%)",
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
