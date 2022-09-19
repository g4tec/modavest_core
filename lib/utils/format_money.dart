import 'package:intl/intl.dart';

final oCCCurrency =
    NumberFormat.currency(locale: "pt_BR", symbol: "R\$", decimalDigits: 2);
String toCurrency(double num) {
  final double number = toMoney(num);
  return oCCCurrency.format(number);
}

double toMoney(double num) {
  String numberStr = num.toString();

  if (numberStr.contains(".")) {
    final List<String> split = numberStr.split(".");
    String integer = split[0];
    String decimal = split[1];
    final String decimal2 = split[1];
    if (decimal.length > 1) {
      decimal = decimal.substring(0, 2);
    }
    if (decimal2.length >= 3 && int.parse(decimal2[2]) >= 5) {
      final value = double.parse("1.$decimal") + 0.01;

      if (value < 2) {
        decimal =
            (double.parse("1.$decimal") + 0.01).toString().replaceAll("1.", "");
      } else {
        integer = (int.parse(integer) + 1).toString();
        decimal = "00";
      }
    }
    numberStr = "$integer.$decimal";
  }
  final double number = double.parse(numberStr);
  return number;
}
