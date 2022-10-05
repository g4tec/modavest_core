import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

class PaymentConditionsWidget extends StatelessWidget {
  final void Function(num?) onSelect;
  final List<PaymentConditions> paymentConditions;
  final num? selected;
  final SalesOrder order;
  final Widget Function({
    required SalesOrder order,
    required PaymentConditions condition,
  }) buildPrice;

  const PaymentConditionsWidget({
    super.key,
    required this.onSelect,
    required this.paymentConditions,
    required this.selected,
    required this.order,
    required this.buildPrice,
  });

  List<DataRow> _buildRows(BuildContext context) {
    final List<DataRow> conditionsWidget = [];

    for (final PaymentConditions condition in paymentConditions) {
      int sumDays = 0;
      for (final String? day in condition.installmentDays ?? []) {
        if (day != null && day != "null") {
          sumDays += int.parse(day);
        }
      }
      final double portion = sumDays > 0
          ? (sumDays / (condition.installmentDays ?? []).length)
          : 0;

      conditionsWidget.add(
        DataRow(
          onSelectChanged: (bool? value) {
            onSelect.call(condition.code);
          },
          cells: <DataCell>[
            DataCell(
              SizedBox(
                height: 25,
                width: 25,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Radio<num>(
                      activeColor: Theme.of(context).primaryColor,
                      value: condition.code,
                      groupValue: selected ?? 0,
                      onChanged: (val) {
                        onSelect.call(val);
                      },
                    ),
                  ),
                ),
              ),
            ),
            DataCell(
              FittedBox(
                  child: buildPrice.call(
                order: order,
                condition: condition,
              )),
            ),
            DataCell(
              Center(
                child: Text(
                  condition.installment ?? "-",
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  portion.ceil().toString(),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return conditionsWidget;
  }

  List<DataColumn> _buildHeader(BuildContext context) {
    return [
      const DataColumn(
        label: SizedBox(),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            ModaVestLabels.description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            ModaVestLabels.installment,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            ModaVestLabels.portion,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: DividerThemeData(color: Colors.grey[300]),
      ),
      child: DataTable(
        showCheckboxColumn: false,
        dataRowHeight: 75,
        columns: _buildHeader(context),
        rows: [
          ..._buildRows(context),
        ],
        columnSpacing: 25,
      ),
    );
  }
}
