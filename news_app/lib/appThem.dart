import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static const primaryLightColor = Color(0xff14C38E);
  static const yeloowColor = Color(0xffFED049);
  static const whiteColor = Color(0xffffffff);
  static const darkGreen = Color(0xff508D69);
  static const purplePrimary = Color(0xff475AD7);
  static const purpleLight = Color(0xff8A96E5);
  static const purpleLighter = Color(0xffEEF0FB);
  static const blackDarker = Color(0xff22242F);
  static const blackPrimary = Color(0xff333647);
  static const purpleDarker = Color(0xff2536A7);
  static const blackLighter = Color(0xff555A77);
  static const greyDarker = Color(0xff666C8E);
  static const greyPrimary = Color(0xff7C82A1);
  static const greyLight = Color(0xffACAFC3);
  static const greyLighter = Color(0xffF3F4F6);

  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.purple,
          )),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: whiteColor,
          centerTitle: true,
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))));
}
