import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static const primaryColor = '0xFF33505a';
  static AppBar defaultAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xFF33505a),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: lightBlueish,
        focusColor: darkBlue,
        hintColor: darkBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        canvasColor: creamColor,
        cardColor: Colors.white,
        buttonTheme: ButtonThemeData(
          buttonColor: lightBlueish,
        )
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primaryColor: lightBlueish,
    hintColor: lightBlueish,
    focusColor: creamColor,
    canvasColor: darkColor,
    cardColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Color(0xfff5f5f5),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: darkBlue,
    )
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkBlue = Color(0xff403b58);
  static Color lightBlueish = Vx.indigo500;
}
