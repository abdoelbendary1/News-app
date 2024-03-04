import 'package:flutter/material.dart';

class AppTheme {
  static final primaryLightColor = Color(0xff14C38E);
  static final yeloowColor = Color(0xffFED049);
  static final whiteColor = Color(0xffffffff);
  static final darkGreen = Color(0xff508D69);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primaryLightColor,
          foregroundColor: whiteColor,
          centerTitle: true,
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))));
}
