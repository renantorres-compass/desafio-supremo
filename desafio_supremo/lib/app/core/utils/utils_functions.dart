import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/infra/models/detail_statement_model/detail_statement_model.dart';

class Utils {
  static String convertDateToDayMonth(String? date) {
    return date != null
        ? '${date.substring(8, 10)}/${date.substring(5, 7)}'
        : "";
  }

  static bool convertToIsPix(String? tType) {
    return tType != null ? tType.contains('PIX') : false;
  }

  static String convertMoneyValue(String? amount) {
    if (amount != null) {
      var controller = MoneyMaskedTextController(
          initialValue: double.parse(amount),
          decimalSeparator: ',',
          thousandSeparator: '.');

      return "R\$ ${controller.text}";
    } else {
      return "R\$ 0,00";
    }
  }

  static String convertMoneyValueWithType(String? amount, String? tType) {
    bool isOut = tType != null ? tType.contains('OUT') : false;

    String value = convertMoneyValue(amount);

    return '${isOut ? "- " : ""} $value';
  }

  static String convertDateHour(String? date) {
    if (date != null && date.isNotEmpty) {
      var dateTime = DateTime.parse(date);
      String day = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
      String hour = "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
      return "$day - $hour";
    } else {
      return "";
    }
  }

  static List convertDetailStatementModeltoList(DetailStatementModel? value) {
    return value != null
        ? [
            value.description ?? "",
            convertMoneyValue(value.amount.toString()),
            value.to ?? value.from ?? "",
            value.bankName ?? "",
            convertDateHour(value.createdAt),
            value.authentication ?? ""
          ]
        : [];
  }

  static Future<void> captureImgAndShare(
      ScreenshotController screenshotController, BuildContext context) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();

    await screenshotController
        .capture(
            pixelRatio: pixelRatio, delay: const Duration(milliseconds: 10))
        .then((imageFile) async {
      if (imageFile != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath =
            await File('${directory.path}/$fileName.png').create();
        await imagePath.writeAsBytes(imageFile);
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
