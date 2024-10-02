import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

DateTime? convertDate(String dateString) {
  try {
    return DateFormat('dd/MM/yyyy').parse(dateString);
  } catch (_) {
    return null;
  }
}

String formatDateYMD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

DateTime safeParseDate(String string) {
  try {
    return DateTime.parse(string);
  } catch (e) {
    if (string.split("-")[0].length < 4) {
      return safeParseDate("0$string");
    }
    rethrow;
  }
}
