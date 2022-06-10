import 'package:desafio_supremo/app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/ui/ui.dart';

Widget shareDetailsButton(
    {required ThemeData appTheme,
    required BuildContext context,
    required ScreenshotController screenshotController}) {
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Container(
      width: size.width,
      height: 48,
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
      ),
      child: TextButton(
          style: TextButton.styleFrom(
              primary: AppColors.primaryColorLight,
              backgroundColor: AppColors.primaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero)),
          onPressed: () async {
            await Utils.captureImgAndShare(screenshotController);
          },
          child: Text(
            'Compartilhar',
            style: appTheme.textTheme.subtitle2,
          )),
    ),
  );
}
