import 'package:decimal/decimal.dart';
import 'package:modavest_core/data/models/item_sales_order/item_sales_order_hive.dart';
import 'package:modavest_core/data/models/sales_order/sales_order_hive.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';

class BagCoreDatasource {
  HiveSalesOrder computeWithoutPaymentCondition(
      {required HiveSalesOrder salesOrder}) {
    Decimal totalAmountOrder = Decimal.zero;
    double totalOriginalAmount = 0;

    for (final HiveItemSalesOrder item in salesOrder.items ?? []) {
      item.price = item.originalPrice ?? item.price;
      totalAmountOrder += Decimal.parse(item.price.toString()) *
          Decimal.parse((item.quantity ?? 0).toString());
      totalOriginalAmount += (item.originalPrice ?? 0) * (item.quantity ?? 0);
    }

    salesOrder.totalAmountOrder = totalAmountOrder.toDouble();
    salesOrder.totalOriginalAmountOrder = totalOriginalAmount;

    return salesOrder;
  }

  HiveSalesOrder computePaymentConditionDiscount(
      {required PaymentConditions condition,
      required HiveSalesOrder salesOrder}) {
    Decimal totalAmountOrder = Decimal.zero;
    double totalOriginalAmount = 0;

    for (final HiveItemSalesOrder item in salesOrder.items ?? []) {
      if (condition.averagePeriod?.variationPercentage != null) {
        item.price = (item.originalPrice ?? 0) *
            ((100 + condition.averagePeriod!.variationPercentage!) / 100);
      } else if (condition.averagePeriod?.variationValue != null) {
        item.price = (item.originalPrice ?? 0) +
            condition.averagePeriod!.variationValue!;
      } else {
        item.price = item.originalPrice ?? 0;
      }

      totalAmountOrder += Decimal.parse(item.price.toString()) *
          Decimal.parse((item.quantity ?? 0).toString());
      totalOriginalAmount += (item.originalPrice ?? 0) * (item.quantity ?? 0);
    }

    salesOrder.totalAmountOrder = totalAmountOrder.toDouble();
    salesOrder.totalOriginalAmountOrder = totalOriginalAmount;

    return salesOrder;
  }

  double getPortion(PaymentConditions condition) {
    if (condition.installmentDays != null) {
      int sumDays = 0;
      for (final String? day in condition.installmentDays!) {
        if (day != null && day != "null") {
          sumDays += int.parse(day);
        }
      }
      final double portion =
          sumDays > 0 ? (sumDays / condition.installmentDays!.length) : 0;
      return portion;
    }
    return 0;
  }
}
