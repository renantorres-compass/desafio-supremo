
import 'package:flutter/material.dart';

Widget customListTile(ThemeData appTheme,
    {required String typeTitle,
    required String typeOrigin,
    required String typeAmount}) {
  return Expanded(
    flex: 3,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
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