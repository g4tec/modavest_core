import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ModavestDatePickerRangeField extends StatelessWidget {
  final String title;
  final DateTime? initialDate;
  final DateTime? finalDate;
  final void Function()? callBack;
  final Color? fieldColor;
  final Color? rangeSelectColor;
  final Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final bool popOnSelect;

  const ModavestDatePickerRangeField({
    Key? key,
    required this.title,
    this.initialDate,
    this.finalDate,
    required this.onSelectionChanged,
    this.callBack,
    this.fieldColor,
    this.rangeSelectColor,
    this.popOnSelect = true,
  }) : super(key: key);

  void onShowDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SfDateRangePicker(
            backgroundColor: rangeSelectColor ?? Colors.white,
            cancelText: "CANCELAR",
            onSelectionChanged: onSelectionChanged,
            onCancel: () => Navigator.of(context).pop(),
            onSubmit: (Object? args) {
              if (popOnSelect) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
              callBack?.call();
            },
            showActionButtons: true,
            maxDate: DateTime(2100),
            minDate: DateTime(1900),
            selectionMode: DateRangePickerSelectionMode.range,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat mask = DateFormat("dd/MM/yy");
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: TextButton.icon(
          onPressed: () => onShowDateRangePicker(context),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: fieldColor ?? Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              if (initialDate != null && finalDate != null)
                Text(
                  "${mask.format(initialDate!)} à ${mask.format(finalDate!)}",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: fieldColor ?? Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
            ],
          ),
          icon: Icon(
            Icons.calendar_month,
            color: fieldColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
