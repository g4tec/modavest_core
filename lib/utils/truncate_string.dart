String truncateString(String text, {int length = 7, String omission = '...'}) {
  if (length >= text.length - omission.length) {
    return text;
  }
  return text.replaceRange(length, text.length - omission.length, omission);
}
