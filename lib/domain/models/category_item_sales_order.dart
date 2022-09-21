import 'package:modavest_core/domain/models/color.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';

class ColorItemSalesOrder {
  final Color color;
  List<ItemSalesOrder> items;
  num subtotal;
  num amount;

  ColorItemSalesOrder({
    required this.color,
    this.items = const [],
    required this.amount,
    required this.subtotal,
  });
}
