import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';

Widget shareDetailsButton(
    {required ThemeData appTheme, required BuildContext context}) {
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
          onPressed: () {},
          child: Text(
            'Compartilhar',
            style: appTheme.textTheme.subtitle2,
          )),
    ),
  );
}
