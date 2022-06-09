import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';

Widget dateWidget(ThemeData appTheme, BuildContext context,
    {required bool isPix, required String date}) {
  final size = MediaQuery.of(context).size;
  return Flexible(
      child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
    child: isPix
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: AppColors.primaryColor,
              height: 19,
              width: size.width,
              alignment: Alignment.center,
              child: Text(
                "Pix",
                style: appTheme.textTheme.subtitle2,
              ),
            ),
            Text(
              date,
              style: appTheme.textTheme.subtitle1,
            ),
          ])
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
              ),
              Text(
                date,
                style: appTheme.textTheme.subtitle1,
              ),
            ],
          ),
  ));
}
