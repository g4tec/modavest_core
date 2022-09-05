String formatListStringToDisplay(List<String> list) {
  String formatedString = "";
  for (var i = 0; i < list.length; i++) {
    String buffer = formatedString;
    buffer += list[i];
    if (i < list.length - 1) {
      buffer += ", ";
    }
    formatedString = buffer;
  }

  return formatedString;
}
