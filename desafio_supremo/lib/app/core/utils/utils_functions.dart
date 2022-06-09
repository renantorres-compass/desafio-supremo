class Utils {
  static String convertDateToDayMonth(String? date) {
    if (date != null) {
      return '${date.substring(8, 10)}/${date.substring(5, 7)}';
    } else {
      return "";
    }
  }
}
