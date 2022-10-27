import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

class PaymentOptions {
  final String name;
  final int id;
  final IconData icon;
  final Widget Function(BuildContext context, SalesOrder order,
      List<PaymentConditions> paymentConditions,
      {void Function(num?)? onSelectConditions})? buildConditions;

  PaymentOptions({
    required this.name,
    required this.id,
    required this.icon,
    this.buildConditions,
  });
}
