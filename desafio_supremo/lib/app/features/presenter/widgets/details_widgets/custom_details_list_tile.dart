import 'package:flutter/material.dart';

Widget customDetailsListTile(
    ThemeData appTheme, String titleType, String textType) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
    alignment: AlignmentDirectional.topStart,
    child: Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            titleType,
            style: appTheme.textTheme.bodyText1,
          ),
        ),
        Flexible(
          child: Text(
            textType,
            style: appTheme.textTheme.subtitle1,
          ),
        ),
      ],
    ),
  );
}
