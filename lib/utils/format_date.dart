import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

String formatDateYMD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
