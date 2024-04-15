import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:modavest_core/data/models/item_sales_order/item_sales_order_hive.dart';
import 'package:modavest_core/data/models/sales_order/sales_order_hive.dart';
import 'package:modavest_core/data/models/sales_order/sales_order_model.dart';
import 'package:modavest_core/domain/models/item_sales_order.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/price_table_scales.dart';
import 'package:modavest_core/domain/models/scale.dart';

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
      if ((condition.averagePeriod?.variationPercentage ?? condition.variationPercentage) != null) {
        item.price = (item.originalPrice ?? 0) *
            ((100 + (condition.averagePeriod?.variationPercentage ?? condition.variationPercentage)!) / 100);
      } else if ((condition.averagePeriod?.variationValue ?? condition.variationValue) != null) {
        item.price = (item.originalPrice ?? 0) +
            (condition.averagePeriod?.variationValue ?? condition.variationValue)!;
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

  List<Scale> convertScale(List<Scale> scales) {
    scales.sort((a, b) => (a.quantity ?? 0).compareTo(b.quantity ?? 0));
    final List<Scale> simplifiedScale = scales;

    for (int i = 0; i < scales.length; i++) {
      simplifiedScale[i].minQuantity = i > 0 ? scales[i - 1].quantity : 0;
    }

    return simplifiedScale;
  }

  Future<SalesOrderModel> computeProductScaleDiscount(
      {required List<PriceTableScales> priceTableScales,
      HiveSalesOrder? salesOrderHive,
      required SalesOrderModel salesOrder,
      Function({
        required Iterable<ItemSalesOrder> itensToDiscount,
        required Scale scaleSimplified,
        Iterable<HiveItemSalesOrder>? hiveItensSalesOrder,
        Function()? callBack,
      })?
          setDiscounts}) async {
    for (final PriceTableScales priceTableScale in priceTableScales) {
      final List<Scale> simplifiedScale = convertScale(priceTableScale.scales);

      for (final Scale scaleSimplified in simplifiedScale) {
        if (salesOrder.items != null) {
          final Iterable<ItemSalesOrder> itensToDiscount =
              salesOrder.items!.where(
            (element) =>
                element.quantity != null &&
                element.quantity! > 0 &&
                element.quantity! > (scaleSimplified.minQuantity ?? 0) &&
                element.quantity! <= (scaleSimplified.quantity ?? 9999999) &&
                element.scaleCode == scaleSimplified.scaleCode &&
                (element.price ?? 0) > 0,
          );
          await setDiscounts?.call(
            itensToDiscount: itensToDiscount,
            scaleSimplified: scaleSimplified,
            hiveItensSalesOrder: salesOrderHive?.items,
            callBack: () =>
                salesOrderHive?.observations?.add("SCALE DICOUNT ON PRODUCT"),
          );
        }
      }
    }
    return salesOrder;
  }

  Future<SalesOrderModel> computeColorScaleDiscount({
    required List<PriceTableScales> priceTableScales,
    HiveSalesOrder? salesOrderHive,
    required SalesOrderModel salesOrder,
    Function({
      required Iterable<ItemSalesOrder> itensToDiscount,
      required Scale scaleSimplified,
      Iterable<HiveItemSalesOrder>? hiveItensSalesOrder,
      Function()? callBack,
    })?
        setDiscounts,
  }) async {
    for (final PriceTableScales priceTableScale in priceTableScales) {
      final List<Scale> simplifiedScale = convertScale(priceTableScale.scales);

      for (final Scale scaleSimplified in simplifiedScale) {
        if (salesOrder.items != null) {
          final Map<String?, List<ItemSalesOrder>> res = groupBy(
            salesOrder.items ?? [],
            (ItemSalesOrder item) => '${item.referenceCode}${item.colorCode}',
          );
          res.removeWhere((key, value) {
            final num total = value.fold(0, (total, next) {
              num nextValue = 0;
              if (next.scaleCode == scaleSimplified.scaleCode &&
                  (next.price ?? 0) > 0) {
                nextValue = next.quantity ?? 0;
              }
              return total + nextValue;
            });

            return total <= (scaleSimplified.minQuantity ?? 0) ||
                total > (scaleSimplified.quantity ?? 9999999) ||
                !value.any(
                  (element) => element.scaleCode == scaleSimplified.scaleCode,
                );
          });

          final List<ItemSalesOrder> itensToDiscount = [];

          for (final List<ItemSalesOrder> itensColorToDiscount in res.values) {
            itensToDiscount.addAll(itensColorToDiscount);
          }

          await setDiscounts?.call(
            itensToDiscount: itensToDiscount,
            scaleSimplified: scaleSimplified,
            hiveItensSalesOrder: salesOrderHive?.items,
            callBack: () =>
                salesOrderHive?.observations?.add("SCALE DICOUNT ON PRODUCT"),
          );
        }
      }
    }
    return salesOrder;
  }

  Future<SalesOrderModel> computeReferenceScaleDiscount({
    required List<PriceTableScales> priceTableScales,
    HiveSalesOrder? salesOrderHive,
    required SalesOrderModel salesOrder,
    Function({
      required Iterable<ItemSalesOrder> itensToDiscount,
      required Scale scaleSimplified,
      Iterable<HiveItemSalesOrder>? hiveItensSalesOrder,
      Function()? callBack,
    })?
        setDiscounts,
  }) async {
    for (final PriceTableScales priceTableScale in priceTableScales) {
      final List<Scale> simplifiedScale = convertScale(priceTableScale.scales);

      for (final Scale scaleSimplified in simplifiedScale) {
        if (salesOrder.items != null) {
          final Map<String?, List<ItemSalesOrder>> res = groupBy(
            salesOrder.items ?? [],
            (ItemSalesOrder item) => item.referenceCode,
          );
          res.removeWhere((key, value) {
            final num total = value.fold(0, (total, next) {
              num nextValue = 0;
              if (next.scaleCode == scaleSimplified.scaleCode &&
                  (next.price ?? 0) > 0) {
                nextValue = next.quantity ?? 0;
              }
              return total + nextValue;
            });
            return total <= (scaleSimplified.minQuantity ?? 0) ||
                total > (scaleSimplified.quantity ?? 9999999);
          });

          final List<ItemSalesOrder> itensToDiscount = [];

          for (final List<ItemSalesOrder> itensReferencesToDiscount
              in res.values) {
            itensToDiscount.addAll(itensReferencesToDiscount);
          }

          await setDiscounts?.call(
            itensToDiscount: itensToDiscount,
            scaleSimplified: scaleSimplified,
            hiveItensSalesOrder: salesOrderHive?.items,
            callBack: () =>
                salesOrderHive?.observations?.add("SCALE DICOUNT ON PRODUCT"),
          );
        }
      }
    }
    return salesOrder;
  }

  Future<SalesOrderModel> computeOrderScaleDiscount({
    required List<PriceTableScales> priceTableScales,
    HiveSalesOrder? salesOrderHive,
    required SalesOrderModel salesOrder,
    Function({
      required Iterable<ItemSalesOrder> itensToDiscount,
      required Scale scaleSimplified,
      Iterable<HiveItemSalesOrder>? hiveItensSalesOrder,
      Function()? callBack,
    })?
        setDiscounts,
  }) async {
    final num totalQuantity = salesOrder.items!.fold(0, (total, next) {
      return total + (next.quantity ?? 0);
    });

    for (final PriceTableScales priceTableScale in priceTableScales) {
      final List<Scale> simplifiedScale = convertScale(priceTableScale.scales);

      for (final Scale scaleSimplified in simplifiedScale) {
        if (salesOrder.items != null) {
          final List<ItemSalesOrder> res =
              salesOrder.items!.map((e) => ItemSalesOrder.copy(e)).toList();
          res.removeWhere((value) {
            return (totalQuantity <= (scaleSimplified.minQuantity ?? 0) ||
                    totalQuantity > (scaleSimplified.quantity ?? 9999999)) ||
                value.scaleCode != scaleSimplified.scaleCode;
          });

          final List<ItemSalesOrder> itensToDiscount = [];

          for (final ItemSalesOrder itensReferencesToDiscount
              in salesOrder.items!) {
            if (res.any(
              (r) => r.productCode == itensReferencesToDiscount.productCode,
            )) {
              itensToDiscount.add(itensReferencesToDiscount);
            }
          }

          await setDiscounts?.call(
            itensToDiscount: itensToDiscount,
            scaleSimplified: scaleSimplified,
            hiveItensSalesOrder: salesOrderHive?.items,
            callBack: () =>
                salesOrderHive?.observations?.add("SCALE DICOUNT ON PRODUCT"),
          );
        }
      }
    }
    return salesOrder;
  }
}
