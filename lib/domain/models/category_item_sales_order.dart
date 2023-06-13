import 'package:modavest_core/domain/models/color.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/product_stock.dart';

class ColorItemSalesOrder {
  final Color color;
  List<ItemSalesOrder> items;
  List<ProductStock>? productStock;
  num subtotal;
  num amount;
  num notIncludedAmount;

  ColorItemSalesOrder({
    required this.color,
    this.items = const [],
    required this.amount,
    required this.notIncludedAmount,
    required this.subtotal,
    this.productStock,
  });
}
