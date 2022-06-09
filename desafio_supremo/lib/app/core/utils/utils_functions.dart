class Utils {
  String convertDateToDayMonth(String? date) {
    if (date != null) {
      return '${date.substring(9, 11)}/${date.substring(6, 8)}';
    } else {
      return "";
    }
  }
}
