import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDetailsListTile extends StatelessWidget {
  const CustomDetailsListTile(
      {Key? key,
      required this.appTheme,
      required this.titleType,
      required this.textType})
      : super(key: key);

  final ThemeData appTheme;
  final String titleType;
  final String textType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 45.h,
      width: size.width,
      alignment: AlignmentDirectional.topStart,
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              titleType,
              style: appTheme.textTheme.headline3,
            ),
          ),
          Flexible(
            child: Text(
              textType,
              style: appTheme.textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
