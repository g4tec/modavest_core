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
  final double? totalItens;
  final SalesOrder? selectedSalesOrder;
  final String label;
  final Widget Function(String?)? buildImage;
  final bool isLoadingTotal;

  const BottomButtonBag({
    super.key,
    required this.onNext,
    required this.step,
    required this.isActive,
    required this.label,
    this.selectedSalesOrder,
    this.subTotal,
    this.total,
    this.totalItens,
    this.buildImage,
    this.isLoadingTotal = false,
  });

  Widget buildTotal({
    required BuildContext context,
    required double total,
  }) {
    return FittedBox(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: ModavestTitle(
                  ModaVestLabels.totalBag,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                child: isLoadingTotal
                    ? CircularProgressIndicator()
                    : AutoSizeText(
                        toCurrency(total),
                        minFontSize: 1,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                        textAlign: TextAlign.end,
                      ),
              ),
            ],
          ),
          if (totalItens != null)
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ModavestTitle(
                    ModaVestLabels.qtdItens,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: AutoSizeText(
                    totalItens!.toStringAsFixed(0),
                    minFontSize: 1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
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
            child: buildImage
                    ?.call(selectedSalesOrder?.oficialStore?.logoUrl ?? "") ??
                ImageColorReferenceView(
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
        child: isLoadingTotal
            ? CircularProgressIndicator()
            : Text(
                toCurrency(selectedSalesOrder.totalAmountOrder ?? 0),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
    final double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    final customHeight = aspectRatio < 0.6
        ? MediaQuery.of(context).size.height * 0.1
        : MediaQuery.of(context).size.height * 0.08;

    final Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: customHeight,
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          color: const Color(0xff434343),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: buildTotalChild(
            context: context,
          ),
        ),
        Container(
          height: customHeight,
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          color: isActive ? const Color(0xffea0e47) : Colors.grey[50],
          alignment: Alignment.center,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        height: customHeight + MediaQuery.of(context).padding.bottom,
        color: Theme.of(context).colorScheme.primary,
        child: FittedBox(
          child: child,
        ),
      ),
    );
  }
}
