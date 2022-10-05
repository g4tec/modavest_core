import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

Future<double?> getPaymentConditionDiscount(
  SalesOrder order,
  num percentage,
) async {
  double discount = 0;

  for (final ItemSalesOrder item in order.items ?? []) {
    discount +=
        ((item.originalPrice ?? 0) * (percentage / 100)) * (item.quantity ?? 1);
  }

  return discount;
}
