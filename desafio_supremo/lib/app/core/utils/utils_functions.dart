import 'package:flutter_masked_text2/flutter_masked_text2.dart';

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

  static String convertMoneyValueWithType(String? amount, String? tType) {
    bool isOut = false;
    if (tType != null) {
      if (tType.contains('OUT')) {
        isOut = true;
      } else {
        isOut = false;
      }
    } else {
      isOut = false;
    }
    if (amount != null) {
      var controller = MoneyMaskedTextController(
          initialValue: double.parse(amount),
          decimalSeparator: ',',
          thousandSeparator: '');

      return '${isOut ? "- " : ""}R\$ ${controller.text}';
    } else {
      return "${isOut ? "- " : ""} R\$ 0,00";
    }
  }

  static String convertMoneyValue(String? amount) {
    if (amount != null) {
      var controller = MoneyMaskedTextController(
          initialValue: double.parse(amount),
          decimalSeparator: ',',
          thousandSeparator: '');

      return "R\$ ${controller.text}";
    } else {
      return "R\$ 0,00";
    }
  }
}
