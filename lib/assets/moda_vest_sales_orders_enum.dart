enum EnumSalesOrders {
  progress,
  finished,
  canceled,
  failed,
}

extension EnumSalesOrdersExtension on EnumSalesOrders {
  String get name {
    switch (this) {
      case EnumSalesOrders.progress:
        return 'progress';
      case EnumSalesOrders.finished:
        return 'finished';
      case EnumSalesOrders.canceled:
        return 'canceled';
      default:
        return "";
    }
  }
}
