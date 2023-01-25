import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_money.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class BottomButtonBag extends StatelessWidget {
  final void Function() onNext;
  final int step;
  final bool isActive;
  final double? total;
  final double? subTotal;
  final SalesOrder? selectedSalesOrder;
  final String label;

  const BottomButtonBag({
    super.key,
    required this.onNext,
    required this.step,
    required this.isActive,
    required this.label,
    this.selectedSalesOrder,
    this.subTotal,
    this.total,
  });

  Widget buildTotal({
    required BuildContext context,
    required double total,
  }) {
    return FittedBox(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: ModavestTitle(
              ModaVestLabels.totalBag,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: AutoSizeText(
              toCurrency(total),
              minFontSize: 1,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubtotal({
    required BuildContext context,
    required SalesOrder selectedSalesOrder,
    required double subtotal,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: ImageColorReferenceView(
              urlImg: selectedSalesOrder.oficialStore?.logoUrl ?? "",
              fit: BoxFit.cover,
              cacheWidth: 50,
            ),
          ),
        ],
      ),
      title: ModavestTitle(
        ModaVestLabels.subtotal,
        color: Colors.white,
        fontSize: 10,
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          toCurrency(selectedSalesOrder.totalAmountOrder ?? 0),
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildTotalChild({
    required BuildContext context,
  }) {
    if (subTotal != null && selectedSalesOrder != null) {
      return buildSubtotal(
        context: context,
        selectedSalesOrder: selectedSalesOrder!,
        subtotal: subTotal!,
      );
    }

    return buildTotal(context: context, total: total!);
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.5,
          color: const Color(0xff434343),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: buildTotalChild(
            context: context,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: isActive ? Colors.white : Colors.grey,
                          fontSize: isActive ? 25 : 18,
                        ),
                  ),
                ),
                if (isActive)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: isActive ? Colors.white : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );

    return GestureDetector(
      onTap: isActive ? onNext : null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        color: isActive ? const Color(0xffea0e47) : Colors.grey[50],
        child: FittedBox(
          child: child,
        ),
      ),
    );
  }
}
