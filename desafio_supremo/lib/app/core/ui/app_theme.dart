import 'package:flutter/material.dart';

ThemeData appThemeData() {
  const primaryColor = Color(0xFF00C1AF);
  const primaryColorDark = Color(0xFF828282);
  const primaryColorLight = Color(0xFFF8F8F8);
  const textColor = Color(0xFF202021);

  final textTheme = TextTheme(
    titleLarge: const TextStyle(
        color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: const TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(blurRadius: 4, offset: Offset(0, 4))]),
    headline1: const TextStyle(
        color: textColor, fontSize: 14, fontWeight: FontWeight.w700),
    bodyText1: const TextStyle(
      color: textColor,
      fontSize: 14,
    ),
    subtitle1: const TextStyle(
      color: primaryColor,
      fontSize: 12,
    ),
    subtitle2: const TextStyle(
      color: Colors.white,
      fontSize: 10,
    ),
  );

  final textButtonData = TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  ));

  return ThemeData(
      primaryColor: primaryColor,
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      textButtonTheme: textButtonData,
      backgroundColor: Colors.white,
      textTheme: textTheme);
}
