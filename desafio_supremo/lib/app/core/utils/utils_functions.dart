class Utils {
  static String convertDateToDayMonth(String? date) {
    if (date != null) {
      return '${date.substring(8, 10)}/${date.substring(5, 7)}';
    } else {
      return "";
    }
  }

  static bool convertToIsPix(String? tType) {
    if (tType != null) {
      if (tType.contains('PIX')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
