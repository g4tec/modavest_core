import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_sales_orders_enum.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/features/orders/presentation/widgets/sales_order_card.dart';
import 'package:modavest_core/widgets/loading/sending_loading.dart';
import 'package:modavest_core/widgets/text/modavest_error.dart';

class SalesOrderList extends StatelessWidget {
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  final void Function(num, num)? onSelect;
  final List<SalesOrder> salesOrderList;
  final bool isFailed;
  final bool isClosed;
  final bool isLoading;
  final bool? isFirstFetch;
  final EnumSalesOrders? status;

  const SalesOrderList({
    super.key,
    required this.scrollController,
    required this.onSelect,
    required this.onRefresh,
    required this.status,
    required this.salesOrderList,
    required this.isLoading,
    this.isFirstFetch,
    this.isFailed = false,
    this.isClosed = false,
  });

  String emptyListMessageCase() {
    switch (status) {
      case EnumSalesOrders.canceled:
        return ModaVestLabels.emptyCanceledOrders;
      case EnumSalesOrders.failed:
        return ModaVestLabels.emptyRejectedOrders;
      case EnumSalesOrders.finished:
        return ModaVestLabels.emptyConcludedOrders;
      case EnumSalesOrders.closed:
        return ModaVestLabels.emptyClosedOrders;
      default:
        return ModaVestLabels.emptyRunningOrders;
    }
  }
// TODO: todos esse código comentado deve ser revisto e ficar nos apps especialitas
  // bool _isLoading(SalesOrdersState state) {
  //   switch (status) {
  //     case EnumSalesOrders.canceled:
  //       return state.isLoadingCanceled ?? false;
  //     case EnumSalesOrders.finished:
  //       return state.isLoadingFinished ?? false;
  //     case EnumSalesOrders.progress:
  //       return state.isLoadingProgress ?? false;
  //     case EnumSalesOrders.failed:
  //       return state.isLoadingFailed ?? false;
  //     default:
  //       return isLoading;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Builder(
      //<SalesOrdersBloc, SalesOrdersState>(
      // bloc: getIt<SalesOrdersBloc>(),
      builder: (context) {
        //, state) {
        // if (state is ErrorLoadingSalesOrdersState) {
        //   return ModavestError(
        //     msg: state.error,
        //     onPress: onRefresh,
        //   );
        // }
        return RefreshIndicator(
          onRefresh: () => onRefresh.call(),
          child: ListView.builder(
            itemCount: salesOrderList.length + 1,
            cacheExtent: 10,
            controller: scrollController,
            padding: const EdgeInsets.only(bottom: 80),
            itemBuilder: (BuildContext context, int index) {
              if (isFirstFetch ?? false) {
                return Column(
                  children: [
                    const SizedBox(height: 100),
                    SendingLoading(
                      title: ModaVestLabels.loadingMore,
                    ),
                  ],
                );
              }
              if (salesOrderList.isNotEmpty) {
                if (index < salesOrderList.length) {
                  return SalesOrderCard(
                    salesOrder: salesOrderList[index],
                    onSelect: () => onSelect?.call(
                      isFailed || isClosed
                          ? index
                          : salesOrderList[index].orderCode!,
                      salesOrderList[index].integrationId!,
                    ),
                    isFailed: isFailed,
                  );
                }
                if (isLoading) {
                  return SendingLoading(
                    title: ModaVestLabels.loadingMore,
                  );
                }
                return const SizedBox();
              } else {
                if (isLoading) {
                  return Column(
                    children: [
                      const SizedBox(height: 100),
                      SendingLoading(
                        title: ModaVestLabels.loadingMore,
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    ModavestError(
                      msg: emptyListMessageCase(),
                      onPress: () => onRefresh.call(),
                    )
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
