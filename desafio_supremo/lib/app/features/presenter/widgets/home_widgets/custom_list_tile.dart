import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.appTheme,
      required this.typeTitle,
      required this.typeOrigin,
      required this.typeAmount})
      : super(key: key);

  final ThemeData appTheme;
  final String typeTitle;
  final String typeOrigin;
  final String typeAmount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Text(
                typeTitle,
                style: appTheme.textTheme.bodyText1,
              ),
            ),
            Flexible(
              child: Text(
                typeOrigin,
                style: appTheme.textTheme.subtitle1,
              ),
            ),
            Flexible(
              child: Text(
                typeAmount,
                style: appTheme.textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
