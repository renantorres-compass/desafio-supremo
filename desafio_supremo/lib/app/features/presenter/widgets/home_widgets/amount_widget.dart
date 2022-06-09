import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';

Widget amountWidget(ThemeData appTheme, bool viewAmount, String amount) {
  return Flexible(
      child: Container(
    height: 91,
    color: AppColors.primaryColorLight,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Text(
                  'Seu saldo',
                  style: appTheme.textTheme.bodyText1,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    viewAmount = !viewAmount;
                  },
                  child: viewAmount
                      ? const Icon(
                          Icons.visibility,
                          color: AppColors.primaryColor,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: AppColors.primaryColor,
                        ))
            ],
          )),
          Flexible(
            child: Text(
              amount,
              style: appTheme.textTheme.headline1,
            ),
          )
        ],
      ),
    ),
  ));
}
