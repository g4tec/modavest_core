enum EnumSalesOrders {
  progress,
  finished,
  canceled,
  failed,
  closed,
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
      case EnumSalesOrders.closed:
        return 'closed';
      default:
        return "";
    }
  }
}
