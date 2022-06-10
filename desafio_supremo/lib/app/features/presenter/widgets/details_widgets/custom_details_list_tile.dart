import 'package:flutter/material.dart';

Widget customDetailsListTile(ThemeData appTheme, String titleType,
    String textType, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: 45,
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
