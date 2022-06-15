import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appThemeData() {
  const primaryColor = Color(0xFF00C1AF);
  const primaryColorDark = Color(0xFF828282);
  const primaryColorLight = Color(0xFFF8F8F8);
  const textColor = Color(0xFF202021);

  final textTheme = TextTheme(
    headline1: TextStyle(
        letterSpacing: 0,
        color: primaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        letterSpacing: 0,
        color: textColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
              blurRadius: 5.r,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25))
        ]),
    headline3: TextStyle(
        letterSpacing: 0,
        color: textColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700),
    bodyText1: TextStyle(
      letterSpacing: 0,
      color: textColor,
      fontSize: 14.sp,
    ),
    subtitle1: TextStyle(
        letterSpacing: 0,
        color: primaryColorDark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
      letterSpacing: 0,
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14.sp,
    ),
  );

  final appBarTheme = AppBarTheme(
      color: Colors.white,
      titleTextStyle: textTheme.headline2,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark));

  return ThemeData(
      primaryColor: primaryColor,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      backgroundColor: Colors.white,
      textTheme: textTheme);
}
