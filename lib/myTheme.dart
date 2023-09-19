import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = Color(0xff242424);
  static Color primaryLight = Color(0xffB7935F);
  static Color primaryDark = Color(0xff141A2E);
  static Color whiteColor = Color(0xffF8F8F8);
  static Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: blackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: blackColor,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: primaryLight,
      selectedIconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    dividerTheme: DividerThemeData(color: primaryLight, thickness: 3),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryDark,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: yellowColor,
      ),
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: yellowColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: yellowColor,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: yellowColor,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: yellowColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: primaryLight,
      selectedIconTheme: IconThemeData(
        color: yellowColor,
      ),
    ),
    dividerTheme: DividerThemeData(color: primaryDark, thickness: 3),
  );
}
