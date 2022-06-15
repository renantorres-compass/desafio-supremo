import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/ui.dart';

class DateWidget extends StatelessWidget {
  const DateWidget(
      {Key? key,
      required this.appTheme,
      required this.isPix,
      required this.date})
      : super(key: key);

  final ThemeData appTheme;
  final bool isPix;
  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
      child: isPix
          ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                color: AppColors.primaryColor,
                height: 19.h,
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
}
